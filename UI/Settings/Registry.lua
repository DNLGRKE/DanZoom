-- ============================================================================
-- DanZoom - Settings UI Registry
-- Root + Subcategories (each in its own file)
-- ============================================================================

local DZ = DanZoom
if not DZ then return end

local H = DZ.UI and DZ.UI.SettingsHelpers
if not H then return end

local function RegisterSettings()
  local createCheckbox = H.GetCreateCheckboxFn()
  if not H.HasSettingsAPI(createCheckbox) then return end

  local root = Settings.RegisterVerticalLayoutCategory(DZ:T("ADDON_NAME"))
  local settingsCat = Settings.RegisterVerticalLayoutSubcategory(root, DZ:T("CATEGORY_SETTINGS"))
  local othersCat   = Settings.RegisterVerticalLayoutSubcategory(root, DZ:T("CATEGORY_OTHERS"))

  local anyControl
  local syncFns = {}

  if DZ.UI.RegisterCategory_Settings then
    local ctrl, sync = DZ.UI.RegisterCategory_Settings(settingsCat)
    anyControl = anyControl or ctrl
    if sync then table.insert(syncFns, sync) end
  end

  if DZ.UI.RegisterCategory_Others then
    local ctrl, sync = DZ.UI.RegisterCategory_Others(othersCat)
    anyControl = anyControl or ctrl
    if sync then table.insert(syncFns, sync) end
  end

  Settings.RegisterAddOnCategory(root)
  Settings.RegisterAddOnCategory(settingsCat)
  Settings.RegisterAddOnCategory(othersCat)

  if #syncFns > 0 and anyControl then
    local function SyncAll()
      for _, fn in ipairs(syncFns) do fn() end
    end
    H.HookResyncOnShow(anyControl, SyncAll)
  end
end

function DanZoom_CreateSettingsUI()
  RegisterSettings()
end
