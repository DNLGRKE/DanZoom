DanZoom = DanZoom or {}
local DZ = DanZoom

DZ.L.enUS = {
  ADDON_NAME = "DanZoom",

  CATEGORY_SETTINGS = "Settings",
  CATEGORY_OTHERS   = "Others",

  MAX_CAMERA_ZOOM      = "Max Camera Zoom",
  MAX_CAMERA_ZOOM_DESC = "Sets how far you can zoom out at most.",

  MIN_ZOOM_ENABLED_LABEL = "Limit zoom-in (block first-person)",
  MIN_ZOOM_ENABLED_DESC  = "Prevents zooming in closer than the minimum distance.",

  MIN_ZOOM_DISTANCE_LABEL = "Minimum zoom distance",
  MIN_ZOOM_DISTANCE_DESC  = "How close you can zoom in. 0.0 allows first-person.",

  LOGIN_MESSAGE_LABEL = "Show login message",
  LOGIN_MESSAGE_DESC  = "Shows a short message in chat on login.",
  LOGIN_MIN_ON  = "(Min zoom: %.1f)",
  LOGIN_MIN_OFF = "(Min zoom: off)",

  LOADED_MSG = "loaded – Current MaxZoom: %.1f",
}
