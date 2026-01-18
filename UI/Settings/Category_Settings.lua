-- ============================================================================
-- DanZoom - Settings UI (Category: Settings)
-- ============================================================================

local DZ = DanZoom
local H = DZ.UI and DZ.UI.SettingsHelpers

DZ.UI = DZ.UI or {}

function DZ.UI.RegisterCategory_Settings(category)
  if not (category and H) then return nil end
  local createCheckbox = H.GetCreateCheckboxFn()
  if not createCheckbox then return nil end

  -- Max Zoom
  local maxZoomSetting = Settings.RegisterProxySetting(
    category,
    "DANZOOM_MAX_ZOOM_FACTOR",
    Settings.VarType.Number,
    DZ:T("MAX_CAMERA_ZOOM"),
    DZ.defaults.maxZoom,
    function() return DZ:GetMaxZoom() end,
    function(value) DZ:SetMaxZoom(value) end
  )

  local maxC = DZ.C.MAX
  local maxOptions = Settings.CreateSliderOptions(maxC.MIN, maxC.MAX, maxC.STEP)
  if maxOptions.SetLabelFormatter and MinimalSliderWithSteppersMixin and MinimalSliderWithSteppersMixin.Label then
    maxOptions:SetLabelFormatter(
      MinimalSliderWithSteppersMixin.Label.Right,
      function(v) return string.format("%.1f", DZ:NormalizeMax(v)) end
    )
  end

  local maxSlider = Settings.CreateSlider(
    category,
    maxZoomSetting,
    maxOptions,
    DZ:T("MAX_CAMERA_ZOOM_DESC")
  )

  -- Min Zoom enabled
  local minEnabledSetting = Settings.RegisterProxySetting(
    category,
    "DANZOOM_MIN_ZOOM_ENABLED",
    Settings.VarType.Boolean,
    DZ:T("MIN_ZOOM_ENABLED_LABEL"),
    DZ.defaults.minZoomEnabled,
    function() return DZ:GetMinZoomEnabled() end,
    function(value) DZ:SetMinZoomEnabled(value) end
  )

  createCheckbox(
    category,
    minEnabledSetting,
    DZ:T("MIN_ZOOM_ENABLED_DESC")
  )

  -- Min Zoom distance
  local minDistSetting = Settings.RegisterProxySetting(
    category,
    "DANZOOM_MIN_ZOOM_DISTANCE",
    Settings.VarType.Number,
    DZ:T("MIN_ZOOM_DISTANCE_LABEL"),
    DZ.defaults.minZoomDistance,
    function() return DZ:GetMinZoomDistance() end,
    function(value) DZ:SetMinZoomDistance(value) end
  )

  local minC = DZ.C.MIN
  local minOptions = Settings.CreateSliderOptions(minC.MIN, minC.MAX, minC.STEP)
  if minOptions.SetLabelFormatter and MinimalSliderWithSteppersMixin and MinimalSliderWithSteppersMixin.Label then
    minOptions:SetLabelFormatter(
      MinimalSliderWithSteppersMixin.Label.Right,
      function(v) return string.format("%.1f", DZ:NormalizeMinDistance(v)) end
    )
  end

  local minSlider = Settings.CreateSlider(
    category,
    minDistSetting,
    minOptions,
    DZ:T("MIN_ZOOM_DISTANCE_DESC")
  )

  local function Sync()
    maxZoomSetting:SetValue(DZ:GetMaxZoom())
    minEnabledSetting:SetValue(DZ:GetMinZoomEnabled())
    minDistSetting:SetValue(DZ:GetMinZoomDistance())
  end

  return maxSlider or minSlider, Sync
end
