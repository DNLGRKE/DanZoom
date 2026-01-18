-- ============================================================================
-- DanZoom - DB
-- SavedVariables init + defaults.
-- ============================================================================

local DZ = DanZoom

DZ.defaults = {
  maxZoom = 2.6,
  showLoginMessage = true,
  minZoomEnabled = false,
  minZoomDistance = 0.0,
}

function DZ:InitDB()
  DanZoomDB = DanZoomDB or {}

  if DanZoomDB.maxZoom == nil then DanZoomDB.maxZoom = DZ.defaults.maxZoom end
  if DanZoomDB.showLoginMessage == nil then DanZoomDB.showLoginMessage = DZ.defaults.showLoginMessage end
  if DanZoomDB.minZoomEnabled == nil then DanZoomDB.minZoomEnabled = DZ.defaults.minZoomEnabled end
  if DanZoomDB.minZoomDistance == nil then DanZoomDB.minZoomDistance = DZ.defaults.minZoomDistance end

  -- Cleanup: normalize stored values
  DanZoomDB.maxZoom = DZ:NormalizeMax(DanZoomDB.maxZoom)
  DanZoomDB.minZoomDistance = DZ:NormalizeMinDistance(DanZoomDB.minZoomDistance)
end
