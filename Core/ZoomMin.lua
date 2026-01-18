-- ============================================================================
-- DanZoom - Min Zoom (zoom-in limit / blocks first-person)
-- Enforces after zoom-in input by pushing camera back out (debounced).
-- ============================================================================

local DZ = DanZoom

function DZ:GetMinZoomEnabled()
  if not DanZoomDB or DanZoomDB.minZoomEnabled == nil then
    return DZ.defaults.minZoomEnabled
  end
  return DanZoomDB.minZoomEnabled
end

function DZ:SetMinZoomEnabled(v)
  DanZoomDB.minZoomEnabled = not not v
  DZ:EnforceMinZoom()
end

function DZ:GetMinZoomDistance()
  if not DanZoomDB or DanZoomDB.minZoomDistance == nil then
    return DZ.defaults.minZoomDistance
  end
  return DZ:NormalizeMinDistance(DanZoomDB.minZoomDistance)
end

function DZ:SetMinZoomDistance(v)
  v = DZ:NormalizeMinDistance(v)
  DanZoomDB.minZoomDistance = v
  DZ:EnforceMinZoom()
end

function DZ:EnforceMinZoom()
  if not DZ:GetMinZoomEnabled() then return end

  local minDist = DZ:GetMinZoomDistance()
  if minDist <= 0 then return end

  local current = GetCameraZoom()
  if type(current) ~= "number" then return end

  local eps = (DZ.C.MIN and DZ.C.MIN.EPS) or 0.05
  if current < (minDist - eps) then
    CameraZoomOut(minDist - current)
  end
end

function DZ:HookZoomIn()
  if DZ._zoomHooked then return end
  DZ._zoomHooked = true

  local function scheduleEnforce()
    -- Debounce: keep only the last enforcement call during scroll spam
    if DZ._minZoomTimer and DZ._minZoomTimer.Cancel then
      DZ._minZoomTimer:Cancel()
    end

    local delay = (DZ.C.MIN and DZ.C.MIN.DEBOUNCE) or 0.05
    DZ._minZoomTimer = C_Timer.NewTimer(delay, function()
      if DanZoom then DanZoom:EnforceMinZoom() end
    end)
  end

  hooksecurefunc("CameraZoomIn", function()
    scheduleEnforce()
  end)
end
