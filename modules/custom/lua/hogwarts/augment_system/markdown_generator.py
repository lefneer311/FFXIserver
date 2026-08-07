from pathlib import Path
import re

src = Path("/mnt/data/Pasted text.txt")
text = src.read_text(encoding="utf-8")

tiers = {}
current = None

tier_start_re = re.compile(r"^\s*\[(\d+)\]\s*=\s*\{")
entry_re = re.compile(
    r'^\s*\[\s*(\d+)\s*\]\s*=\s*\{\s*'
    r'(\d+)\s*,\s*'      # augmentID
    r'(\d+)\s*,\s*'      # requiredQty
    r'(\d+)\s*,\s*'      # power
    r'"([^"]+)"\s*,\s*'  # materialName
    r'(\d+)\s*,\s*'      # tier
    r'"([^"]+)"\s*'      # description
    r'\}'
)

for line in text.splitlines():
    tm = tier_start_re.match(line)
    if tm:
        tier_num = int(tm.group(1))
        if 0 <= tier_num <= 5:
            current = tier_num
            tiers[current] = []
        else:
            current = None
        continue

    if current is not None:
        em = entry_re.match(line)
        if em:
            material_id = int(em.group(1))
            augment_id = int(em.group(2))
            required_qty = int(em.group(3))
            power = int(em.group(4))
            material = em.group(5)
            tier_from_tuple = int(em.group(6))
            desc = em.group(7)

            tiers[current].append({
                "material": material,
                "qty": required_qty,
                "desc": desc,
                "material_id": material_id,
                "augment_id": augment_id,
                "power": power,
                "tier": tier_from_tuple,
            })

md = []
for tier in range(0, 6):
    md.append(f"## Tier {tier} augments\n")
    md.append("| Material required | Quantity | Augment description |")
    md.append("|---|---:|---|")
    rows = sorted(
        tiers.get(tier, []),
        key=lambda r: (r["material"].lower(), r["qty"], r["desc"].lower())
    )
    for row in rows:
        md.append(f'| {row["material"]} | {row["qty"]} | {row["desc"]} |')
    md.append("")

out = Path("/mnt/data/augment_material_reference_corrected.md")
out.write_text("\n".join(md), encoding="utf-8")

# Basic sanity check: show counts and first few parsed source tuples from Tier 0/5
print(f"Wrote: {out}")
print("Rows by tier:", {tier: len(tiers.get(tier, [])) for tier in range(6)})
print("Tier 0 sample:", [(r["material"], r["qty"], r["desc"]) for r in tiers[0][:5]])
print("Tier 5 cluster sample:", [(r["material"], r["qty"], r["desc"]) for r in tiers[5][:8]])
