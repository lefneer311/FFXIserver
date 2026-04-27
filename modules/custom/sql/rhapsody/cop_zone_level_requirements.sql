-- Enforce early ToAU era zone entry caps
-- Idempotent: safe to re-run.

-- 30-cap Promyvion zones
UPDATE zone_settings
SET restriction = 30
WHERE name IN ('Promyvion-Holla', 'Promyvion-Dem', 'Promyvion-Mea', 'Spire_of_Holla', 'Spire_of_Dem', 'Spire_of_Mea');

-- 40-cap Riverne zone
UPDATE zone_settings
SET restriction = 40
WHERE name IN ('Riverne-Site_B01');

-- 50-cap Promyvion/Riverne zones
UPDATE zone_settings
SET restriction = 50
WHERE name IN ('Promyvion-Vahzl', 'Spire_of_Vahzl', 'Riverne-Site_A01', 'Sacrarium');

-- Optional: sanity check output (leave in during development; remove if you prefer quiet runs)
SELECT zoneid, name, restriction
FROM zone_settings
WHERE name IN (
  'Promyvion-Holla', 'Spire_of_Holla',
  'Promyvion-Dem', 'Spire_of_Dem',
  'Promyvion-Mea', 'Spire_of_Mea',
  'Promyvion-Vahzl', 'Spire_of_Vahzl',
  'Riverne-Site_B01', 'Riverne-Site_A01',
  'Sacrarium'
)
ORDER BY restriction, name;