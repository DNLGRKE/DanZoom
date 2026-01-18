-- ============================================================================
-- DanZoom - Settings UI Helpers
-- ============================================================================

local DZ = DanZoom

local M = {}

function M.GetCreateCheckboxFn()
  if Settings and type(Settings.CreateCheckBox) == "function" then
    return Settings.CreateCheckBox
  end
  if Settings and type(Settings.CreateCheckbox) == "function" then
    return Settings.CreateCheckbox
  end
  return nil
end

function M.HasSettingsAPI(createCheckbox)
  return (Settings
    and Settings.RegisterVerticalLayoutCategory
    and Settings.RegisterVerticalLayoutSubcategory
    and Settings.RegisterAddOnCategory
    and Settings.RegisterProxySetting
    and Settings.CreateSlider
    and Settings.CreateSliderOptions
    and createCheckbox)
end

function M.HookResyncOnShow(anyControl, syncFn)
  if not (anyControl and anyControl.GetParent) then return end
  local panel = anyControl:GetParent()
  panel:HookScript("OnShow", syncFn)
end

DZ.UI = DZ.UI or {}
DZ.UI.SettingsHelpers = M
