-- ============================================================================
-- DanZoom - Settings UI (Category: Others)
-- ============================================================================

local DZ = DanZoom
local H = DZ.UI and DZ.UI.SettingsHelpers

DZ.UI = DZ.UI or {}

function DZ.UI.RegisterCategory_Others(category)
  if not (category and H) then return nil end
  local createCheckbox = H.GetCreateCheckboxFn()
  if not createCheckbox then return nil end

  local msgSetting = Settings.RegisterProxySetting(
    category,
    "DANZOOM_LOGIN_MESSAGE",
    Settings.VarType.Boolean,
    DZ:T("LOGIN_MESSAGE_LABEL"),
    DZ.defaults.showLoginMessage,
    function() return DZ:GetShowLoginMessage() end,
    function(value) DZ:SetShowLoginMessage(value) end
  )

  local cb = createCheckbox(
    category,
    msgSetting,
    DZ:T("LOGIN_MESSAGE_DESC")
  )

  local function Sync()
    msgSetting:SetValue(DZ:GetShowLoginMessage())
  end

  return cb, Sync
end
