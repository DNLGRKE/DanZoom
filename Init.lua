-- ============================================================================
-- DanZoom - Init / Bootstrap
-- ============================================================================

local DZ = DanZoom

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
  DZ:InitDB()

  DZ:ApplyMaxZoom()
  DZ:HookZoomIn()
  DZ:EnforceMinZoom()

  DZ:PrintLoginMessage()

  if DanZoom_CreateSettingsUI then
    DanZoom_CreateSettingsUI()
  end
end)
