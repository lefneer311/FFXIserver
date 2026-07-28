-- Add-only WS jobs patch
-- Preserves all existing stock exceptions.
-- Only fills in missing 0x00 job bytes for jobs that qualify by B-or-better native skill.

START TRANSACTION;

UPDATE weapon_skills SET jobs = 0x00010000000000000000000000000000000100000000 WHERE weaponskillid = 10; -- final_heaven
UPDATE weapon_skills SET jobs = 0x00010000000000000000000000000000000100000000 WHERE weaponskillid = 11; -- ascetics_fury
UPDATE weapon_skills SET jobs = 0x00010000000000000000000000000000000100000000 WHERE weaponskillid = 12; -- stringing_pummel

UPDATE weapon_skills SET jobs = 0x00000000020200000002020002000000020002000000 WHERE weaponskillid = 17; -- viper_bite
UPDATE weapon_skills SET jobs = 0x00000000020200000002020002000000020002000000 WHERE weaponskillid = 20; -- cyclone
UPDATE weapon_skills SET jobs = 0x00000000020200000002020002000000020002000000 WHERE weaponskillid = 22; -- energy_drain
UPDATE weapon_skills SET jobs = 0x00000000010100000000000000000000010001000000 WHERE weaponskillid = 23; -- dancing_edge
UPDATE weapon_skills SET jobs = 0x00000000010100000000000000000000010001000000 WHERE weaponskillid = 24; -- shark_bite
UPDATE weapon_skills SET jobs = 0x00000000010100000000000000000000010001000000 WHERE weaponskillid = 26; -- mercy_stroke
UPDATE weapon_skills SET jobs = 0x00000000010100000000000000000000010001000000 WHERE weaponskillid = 27; -- mandalic_stab
UPDATE weapon_skills SET jobs = 0x00000000010100000001000000000000010001000000 WHERE weaponskillid = 28; -- mordant_rime
UPDATE weapon_skills SET jobs = 0x00000000010100000000000000000000010001000000 WHERE weaponskillid = 29; -- pyrrhic_kleos
UPDATE weapon_skills SET jobs = 0x00000000020200000002020002000000020002000000 WHERE weaponskillid = 30; -- aeolian_edge
UPDATE weapon_skills SET jobs = 0x00000000010100000001000000000000010001000000 WHERE weaponskillid = 31; -- rudras_storm

UPDATE weapon_skills SET jobs = 0x01000000010001000000000000000001000000000001 WHERE weaponskillid = 41; -- swift_blade
UPDATE weapon_skills SET jobs = 0x01000000010001000000000000000001000000000001 WHERE weaponskillid = 43; -- knights_of_round
UPDATE weapon_skills SET jobs = 0x01000000010001000000000000000001000000000001 WHERE weaponskillid = 44; -- death_blossom
UPDATE weapon_skills SET jobs = 0x01000000010001000000000000000001000000000001 WHERE weaponskillid = 45; -- atonement
UPDATE weapon_skills SET jobs = 0x01000000010001000000000000000001000000000001 WHERE weaponskillid = 46; -- expiacion
UPDATE weapon_skills SET jobs = 0x01000000010001000000000000000001000000000001 WHERE weaponskillid = 225; -- chant_du_cygne
UPDATE weapon_skills SET jobs = 0x01000000010001000000000000000001000000000001 WHERE weaponskillid = 227; -- knights_of_rotund
UPDATE weapon_skills SET jobs = 0x02000000020002000000000000000002000000000002 WHERE weaponskillid = 238; -- uriel_blade
UPDATE weapon_skills SET jobs = 0x02000000020002000000000000000002000000000002 WHERE weaponskillid = 239; -- glory_slash

UPDATE weapon_skills SET jobs = 0x01000000000001010000000000000000000000000001 WHERE weaponskillid = 54; -- sickle_moon
UPDATE weapon_skills SET jobs = 0x01000000000001010000000000000000000000000001 WHERE weaponskillid = 55; -- spinning_slash
UPDATE weapon_skills SET jobs = 0x01000000000001010000000000000000000000000001 WHERE weaponskillid = 57; -- scourge
UPDATE weapon_skills SET jobs = 0x01000000000001010000000000000000000000000001 WHERE weaponskillid = 59; -- torcleaver
UPDATE weapon_skills SET jobs = 0x01000000000001010000000000000000000000000001 WHERE weaponskillid = 61; -- dimidiation

UPDATE weapon_skills SET jobs = 0x01000000000000000100000000000000000000000000 WHERE weaponskillid = 73; -- onslaught
UPDATE weapon_skills SET jobs = 0x01000000000000000100000000000000000000000000 WHERE weaponskillid = 74; -- primal_rend

UPDATE weapon_skills SET jobs = 0x01000000000000000000000000000000000000000001 WHERE weaponskillid = 86; -- raging_rush
UPDATE weapon_skills SET jobs = 0x01000000000000000000000000000000000000000001 WHERE weaponskillid = 87; -- full_break
UPDATE weapon_skills SET jobs = 0x01000000000000000000000000000000000000000001 WHERE weaponskillid = 89; -- metatron_torment
UPDATE weapon_skills SET jobs = 0x01000000000000000000000000000000000000000001 WHERE weaponskillid = 90; -- kings_justice
UPDATE weapon_skills SET jobs = 0x01000000000000000000000000000000000000000001 WHERE weaponskillid = 92; -- ukkos_fury

UPDATE weapon_skills SET jobs = 0x01000000000000010000000000000000000000000000 WHERE weaponskillid = 102; -- guillotine
UPDATE weapon_skills SET jobs = 0x01000000000000010000000000000000000000000000 WHERE weaponskillid = 103; -- cross_reaper
UPDATE weapon_skills SET jobs = 0x01000000000000010000000000000000000000000000 WHERE weaponskillid = 105; -- catastrophe
UPDATE weapon_skills SET jobs = 0x01000000000000010000000000000000000000000000 WHERE weaponskillid = 106; -- insurgency
UPDATE weapon_skills SET jobs = 0x01000000000000010000000000000000000000000000 WHERE weaponskillid = 108; -- quietus

UPDATE weapon_skills SET jobs = 0x00000000000000000000000000010000000000000000 WHERE weaponskillid = 121; -- geirskogul

UPDATE weapon_skills SET jobs = 0x00000000000000000000000001000000000000000000 WHERE weaponskillid = 137; -- blade_metsu

UPDATE weapon_skills SET jobs = 0x00000000000000000000000100000000000000000000 WHERE weaponskillid = 153; -- tachi_kaiten
UPDATE weapon_skills SET jobs = 0x00000000000000000000000100000000000000000000 WHERE weaponskillid = 158; -- tachi_suikawari

UPDATE weapon_skills SET jobs = 0x00000100000001000000000000000000000000000100 WHERE weaponskillid = 168; -- hexa_strike
UPDATE weapon_skills SET jobs = 0x00000100000001000000000000000000000000000100 WHERE weaponskillid = 170; -- randgrith
UPDATE weapon_skills SET jobs = 0x00000100000001000000000000000000000000000100 WHERE weaponskillid = 171; -- mystic_boon
UPDATE weapon_skills SET jobs = 0x00000100000001000000000000000000000000000100 WHERE weaponskillid = 173; -- dagan

UPDATE weapon_skills SET jobs = 0x02020200000002000000000000000200000000020200 WHERE weaponskillid = 178; -- earth_crusher
UPDATE weapon_skills SET jobs = 0x02020200000002000000000000000200000000020200 WHERE weaponskillid = 180; -- sunburst
UPDATE weapon_skills SET jobs = 0x01010000000001000000000000000100000000000000 WHERE weaponskillid = 185; -- gate_of_tartarus
UPDATE weapon_skills SET jobs = 0x01010001000001000000000000000100000000000000 WHERE weaponskillid = 186; -- vidohunir
UPDATE weapon_skills SET jobs = 0x01010000000001000000000000000100000000000000 WHERE weaponskillid = 187; -- garland_of_bliss
UPDATE weapon_skills SET jobs = 0x01010000000001000000000000000100000000010000 WHERE weaponskillid = 188; -- omniscience
UPDATE weapon_skills SET jobs = 0x02010000000001000000000000000100000000000100 WHERE weaponskillid = 189; -- cataclysm
UPDATE weapon_skills SET jobs = 0x01010001000001000000000000000100000000010000 WHERE weaponskillid = 190; -- myrkr
UPDATE weapon_skills SET jobs = 0x02020000000002000000000000000200000000000000 WHERE weaponskillid = 240; -- tartarus_torpor

UPDATE weapon_skills SET jobs = 0x00000000000000000000010000000000000000000000 WHERE weaponskillid = 200; -- namas_arrow
UPDATE weapon_skills SET jobs = 0x00000000000000000000010000000000000000000000 WHERE weaponskillid = 202; -- jishnus_radiance

UPDATE weapon_skills SET jobs = 0x00000000000000000000010000000000010000000000 WHERE weaponskillid = 213; -- blast_shot
UPDATE weapon_skills SET jobs = 0x00000000000000000000010000000000010000000000 WHERE weaponskillid = 214; -- heavy_shot
UPDATE weapon_skills SET jobs = 0x00000000000000000000010000000000010000000000 WHERE weaponskillid = 216; -- coronach
UPDATE weapon_skills SET jobs = 0x00000000000000000000010000000000010000000000 WHERE weaponskillid = 217; -- trueflight
UPDATE weapon_skills SET jobs = 0x00000000000000000000010000000000010000000000 WHERE weaponskillid = 218; -- leaden_salute

UPDATE weapon_skills SET jobs = 0x00020000000000000000000000000000000200000000 WHERE weaponskillid = 228; -- final_paradise

COMMIT;