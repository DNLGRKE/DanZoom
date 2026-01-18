-- ============================================================================
-- DanZoom - Localization Helper
-- Resolves localized strings based on GetLocale()
-- Fallback order:
--   1) Current client locale
--   2) enUS
--   3) key itself (debug safety)
-- ============================================================================

local DZ = DanZoom

DZ.L = DZ.L or {}

function DZ:T(key)
  local locale = GetLocale()
  local pack = DZ.L[locale] or DZ.L.enUS or {}
  return pack[key] or key
end
