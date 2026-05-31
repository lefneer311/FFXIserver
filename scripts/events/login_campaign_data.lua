-- Compatibility shim for code or modules still requiring the legacy login campaign data path.
-- New campaign months should be added under scripts/events/login_campaigns/ and registered in
-- scripts/events/login_campaign_registry.lua.

return require('scripts/events/login_campaigns/2025_06')