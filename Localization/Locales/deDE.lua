DanZoom = DanZoom or {}
local DZ = DanZoom

DZ.L.deDE = {
  ADDON_NAME = "DanZoom",

  CATEGORY_SETTINGS = "Einstellungen",
  CATEGORY_OTHERS   = "Sonstiges",

  MAX_CAMERA_ZOOM      = "Max Kamera-Zoom",
  MAX_CAMERA_ZOOM_DESC = "Stellt ein, wie weit du maximal rauszoomen darfst.",

  MIN_ZOOM_ENABLED_LABEL = "Reinzoomen begrenzen (Ego sperren)",
  MIN_ZOOM_ENABLED_DESC  = "Verhindert, dass du näher als die Mindest-Distanz reinzoomst.",

  MIN_ZOOM_DISTANCE_LABEL = "Mindest Zoom-Distanz",
  MIN_ZOOM_DISTANCE_DESC  = "Wie nah du reinzoomen darfst. 0.0 erlaubt Ego-Perspektive.",

  LOGIN_MESSAGE_LABEL = "Login-Nachricht anzeigen",
  LOGIN_MESSAGE_DESC  = "Zeigt beim Login eine kurze Info im Chat an.",
  LOGIN_MIN_ON  = "(Mindestzoom: %.1f)",
  LOGIN_MIN_OFF = "(Mindestzoom: aus)",

  LOADED_MSG = "geladen – Aktueller MaxZoom: %.1f",
}
