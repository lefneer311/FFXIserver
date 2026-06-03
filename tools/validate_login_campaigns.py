#!/usr/bin/env python3
"""Validate explicit Repeat Login Campaign registry and reward tables."""

from __future__ import annotations

import datetime as dt
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
REGISTRY = ROOT / "scripts/events/login_campaign_registry.lua"
ITEM_ENUM = ROOT / "scripts/enum/item.lua"
VALID_TIER_KEYS = {1, 5, 9, 13, 17, 21, 25, 29}
CAMPAIGN_RE = re.compile(
    r"id\s*=\s*(?P<id>\d+).*?"
    r"displayYear\s*=\s*(?P<year>\d+).*?"
    r"displayMonth\s*=\s*(?P<month>\d+).*?"
    r"earnStart\s*=\s*\{(?P<earn_start>[^}]+)\}.*?"
    r"earnEnd\s*=\s*\{(?P<earn_end>[^}]+)\}.*?"
    r"redeemEnd\s*=\s*\{(?P<redeem_end>[^}]+)\}.*?"
    r"rewards\s*=\s*require\('(?P<reward_path>[^']+)'\)",
    re.DOTALL,
)
DATE_FIELD_RE = re.compile(r"(year|month|day|hour)\s*=\s*(\d+)")
TIER_START_RE = re.compile(r"^\s*\[(\d+)\]\s*=\s*$")
PRICE_RE = re.compile(r"\[['\"]price['\"]\]|\bprice\b\s*=\s*(\d+)")
ITEM_RE = re.compile(r"^\s*(xi\.item\.[A-Z0-9_]+|\d+)\s*,")
ITEM_ENUM_RE = re.compile(r"^\s*([A-Z0-9_]+)\s*=")


class ValidationError(Exception):
    pass


def parse_jst_table(text: str) -> dt.datetime:
    fields = {key: int(value) for key, value in DATE_FIELD_RE.findall(text)}
    missing = {"year", "month", "day", "hour"} - fields.keys()
    if missing:
        raise ValidationError(f"JST date is missing fields: {sorted(missing)}")

    return dt.datetime(fields["year"], fields["month"], fields["day"], fields["hour"])


def load_item_enum_names() -> set[str]:
    names: set[str] = set()
    for line in ITEM_ENUM.read_text().splitlines():
        match = ITEM_ENUM_RE.match(line)
        if match:
            names.add(match.group(1))

    return names


def lua_require_to_path(require_path: str) -> Path:
    return ROOT / f"{require_path}.lua"


def parse_reward_file(path: Path, item_names: set[str]) -> None:
    if not path.exists():
        raise ValidationError(f"reward file does not exist: {path.relative_to(ROOT)}")

    text = path.read_text()
    if "-- Source:" not in text or "-- Verification:" not in text:
        raise ValidationError(f"{path.relative_to(ROOT)} is missing source metadata comments")

    lines = text.splitlines()
    tier_keys: set[int] = set()
    current_tier: int | None = None
    in_items = False
    brace_depth = 0
    tier_price: int | None = None
    tier_items: list[str] = []

    def finish_tier() -> None:
        nonlocal current_tier, in_items, brace_depth, tier_price, tier_items
        if current_tier is None:
            return

        if current_tier not in VALID_TIER_KEYS:
            raise ValidationError(f"{path.relative_to(ROOT)} has invalid tier key {current_tier}")

        if tier_price is None or tier_price <= 0:
            raise ValidationError(f"{path.relative_to(ROOT)} tier {current_tier} has invalid price")

        if len(tier_items) < 1:
            raise ValidationError(
                f"{path.relative_to(ROOT)} tier {current_tier} has {len(tier_items)} items; expected at least 1"
            )

        seen: set[str] = set()
        for item in tier_items:
            if item.isdigit():
                raise ValidationError(
                    f"{path.relative_to(ROOT)} tier {current_tier} contains bare numeric item id {item}"
                )

            item_name = item.removeprefix("xi.item.")
            if item_name not in item_names:
                raise ValidationError(
                    f"{path.relative_to(ROOT)} tier {current_tier} references missing xi.item.{item_name}"
                )

            if item_name in seen:
                raise ValidationError(
                    f"{path.relative_to(ROOT)} tier {current_tier} contains duplicate xi.item.{item_name}"
                )

            seen.add(item_name)

        current_tier = None
        in_items = False
        brace_depth = 0
        tier_price = None
        tier_items = []

    for line in lines:
        tier_match = TIER_START_RE.match(line)
        if tier_match:
            finish_tier()
            current_tier = int(tier_match.group(1))
            if current_tier in tier_keys:
                raise ValidationError(f"{path.relative_to(ROOT)} repeats tier key {current_tier}")

            tier_keys.add(current_tier)
            continue

        if current_tier is None:
            continue

        if "['price']" in line or "price" in line:
            price_match = re.search(r"=\s*(\d+)", line)
            if price_match:
                tier_price = int(price_match.group(1))

        if "['items']" in line or re.search(r"\bitems\b\s*=", line):
            in_items = True
            brace_depth = 0
            continue

        if in_items:
            brace_depth += line.count("{") - line.count("}")
            item_match = ITEM_RE.match(line)
            if item_match:
                tier_items.append(item_match.group(1))

            if line.strip() == "}," and brace_depth < 0:
                in_items = False

    finish_tier()

    if not tier_keys:
        raise ValidationError(f"{path.relative_to(ROOT)} does not define any reward tiers")


def validate_registry() -> None:
    registry_text = REGISTRY.read_text()
    item_names = load_item_enum_names()
    seen_ids: set[int] = set()
    campaign_count = 0

    for match in CAMPAIGN_RE.finditer(registry_text):
        campaign_count += 1
        campaign_id = int(match.group("id"))
        if campaign_id in seen_ids:
            raise ValidationError(f"duplicate campaign id {campaign_id}")

        seen_ids.add(campaign_id)

        earn_start = parse_jst_table(match.group("earn_start"))
        earn_end = parse_jst_table(match.group("earn_end"))
        redeem_end = parse_jst_table(match.group("redeem_end"))
        if not earn_start < earn_end < redeem_end:
            raise ValidationError(f"campaign {campaign_id} time windows must satisfy earnStart < earnEnd < redeemEnd")

        expected_id = int(f"{int(match.group('year')):04d}{int(match.group('month')):02d}")
        if campaign_id != expected_id:
            raise ValidationError(f"campaign {campaign_id} id does not match display year/month {expected_id}")

        parse_reward_file(lua_require_to_path(match.group("reward_path")), item_names)

    if campaign_count == 0:
        raise ValidationError("registry does not contain any campaigns")

    print(f"Validated {campaign_count} login campaign(s).")


def main() -> int:
    try:
        validate_registry()
    except ValidationError as err:
        print(f"ERROR: {err}", file=sys.stderr)
        return 1

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
