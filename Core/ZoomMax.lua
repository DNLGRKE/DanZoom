-- ============================================================================
-- DanZoom - Max Zoom (zoom-out limit)
-- Uses CVar: cameraDistanceMaxZoomFactor
-- ============================================================================

local DZ = DanZoom

function DZ:GetMaxZoom()
  if not DanZoomDB or DanZoomDB.maxZoom == nil then
    return DZ.defaults.maxZoom
  end
  return DZ:NormalizeMax(DanZoomDB.maxZoom)
end

function DZ:SetMaxZoom(v)
  v = DZ:NormalizeMax(v)
  DanZoomDB.maxZoom = v
  DZ:ApplyMaxZoom()
end

function DZ:ApplyMaxZoom()
  local v = DZ:GetMaxZoom()
  C_CVar.SetCVar("cameraDistanceMaxZoomFactor", string.format("%.1f", v))
end
