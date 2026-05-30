-- ============================================================
-- 75-Cap Weaponskill Unlock Patch (LSB Base/Main as of 2026-03-04)
-- Goals:
--   1) Remove all unlock requirements (unlock_id -> 0)
--   2) Ensure all skill requirements are achievable at level 75
--      (hard ceiling: 284 = A+ (276) + merits (8))
--   3) Give formerly REMA/quest-gated WS a high-but-reachable skill gate
--      Relic-tier: 262
--      Mythic/quest-tier: 270
--      Late-era WS: 284
-- ============================================================

START TRANSACTION;

-- ------------------------------------------------------------
-- 1) Remove ALL unlock gating
-- ------------------------------------------------------------
UPDATE weapon_skills
SET unlock_id = 0
WHERE unlock_id <> 0;

-- ------------------------------------------------------------
-- 2) Clamp impossible skilllevel requirements for 75-cap play
-- ------------------------------------------------------------
UPDATE weapon_skills
SET skilllevel = 284
WHERE skilllevel > 284;

-- ------------------------------------------------------------
-- 3) Assign high skill requirements to formerly gated WS (skilllevel=0)
--    Grouped by “tier intent”
-- ------------------------------------------------------------

-- =========================
-- Relic-tier iconic WS (262)
-- =========================
UPDATE weapon_skills SET skilllevel = 262 WHERE name IN (
    -- Hand-to-Hand
    'final_heaven',

    -- Dagger
    'mercy_stroke',

    -- Sword
    'knights_of_round',

    -- Great Sword
    'scourge',

    -- Axe
    'onslaught',

    -- Great Axe
    'metatron_torment',

    -- Scythe
    'catastrophe',

    -- Polearm
    'geirskogul',

    -- Katana
    'blade_metsu',

    -- Great Katana
    'tachi_kaiten',

    -- Club
    'randgrith',

    -- Staff
    'gate_of_tartarus',

    -- Archery
    'namas_arrow',

    -- Marksmanship
    'coronach'
);

-- ===========================================
-- Mythic / quest-gated tier WS (270)
-- (These were unlock_id-gated and skilllevel 0)
-- ===========================================
UPDATE weapon_skills SET skilllevel = 270 WHERE name IN (
    -- Hand-to-Hand
    'ascetics_fury',
    'stringing_pummel',

    -- Dagger
    'mandalic_stab',
    'mordant_rime',
    'pyrrhic_kleos',

    -- Sword
    'death_blossom',
    'atonement',
    'expiacion',

    -- Axe
    'primal_rend',

    -- Great Axe
    'kings_justice',

    -- Scythe
    'insurgency',

    -- Polearm
    'drakesbane',

    -- Katana
    'blade_kamu',

    -- Great Katana
    'tachi_rana',

    -- Club
    'mystic_boon',

    -- Staff
    'vidohunir',
    'garland_of_bliss',
    'omniscience',

    -- Marksmanship (magic WS / quest-gated)
    'trueflight',
    'leaden_salute'
);

-- ===========================================
-- Late-era WS (284) - still learnable at 75, but “top gate”
-- (Empy/Aeonic-style, later merit, later content additions, etc.)
-- ===========================================
UPDATE weapon_skills SET skilllevel = 284 WHERE name IN (
    -- Hand-to-Hand
    'victory_smite',

    -- Dagger
    'rudras_storm',

    -- Great Sword
    'torcleaver',
    'dimidiation',

    -- Axe
    'cloudsplitter',

    -- Great Axe
    'ukkos_fury',

    -- Scythe
    'quietus',

    -- Polearm
    'camlanns_torment',

    -- Katana
    'blade_hi',

    -- Great Katana
    'tachi_fudo',

    -- Staff
    'myrkr',

    -- Archery
    'jishnus_radiance',

    -- Marksmanship
    'wildfire',

    -- Sword (late-era)
    'chant_du_cygne',
    'requiescat'
);

-- ===========================================
-- Your custom/additional WS: enforce “top gate” (284)
-- ===========================================
UPDATE weapon_skills SET skilllevel = 284 WHERE name IN (
    'glory_slash',
    'uriel_blade',
    'final_paradise'
);

COMMIT;

-- ============================================================
-- End patch
-- ============================================================