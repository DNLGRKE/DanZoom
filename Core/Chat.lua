-- ============================================================================
-- DanZoom - Chat / Login message
-- ============================================================================

local DZ = DanZoom

function DZ:GetShowLoginMessage()
  if not DanZoomDB or DanZoomDB.showLoginMessage == nil then
    return DZ.defaults.showLoginMessage
  end
  return DanZoomDB.showLoginMessage
end

function DZ:SetShowLoginMessage(v)
  DanZoomDB.showLoginMessage = not not v
end

function DZ:PrintLoginMessage()
  if not DZ:GetShowLoginMessage() then return end

  local maxZoom = DZ:GetMaxZoom()

  local minEnabled = DZ:GetMinZoomEnabled()
  local minDist = DZ:GetMinZoomDistance()

  local minText
  if minEnabled and minDist > 0 then
    minText = string.format(DZ:T("LOGIN_MIN_ON"), minDist)
  else
    minText = DZ:T("LOGIN_MIN_OFF")
  end

  DEFAULT_CHAT_FRAME:AddMessage(
    string.format("|cff33ff99%s|r %s %s",
      DZ:T("ADDON_NAME"),
      string.format(DZ:T("LOADED_MSG"), maxZoom),
      minText
    )
  )
end
