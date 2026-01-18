# DanZoom

DanZoom is a lightweight World of Warcraft Retail addon that lets you customize camera zoom behavior in a simple and controlled way.

## Features
* Set custom **maximum camera zoom** (via CVar)
* Optional **minimum zoom distance** to block first-person view
* Debounced zoom-in enforcement (no camera jitter)
* In-game Settings UI with subcategories
* Login message showing current zoom status
* Localization: English and German

## Installation
1. Download or clone this repository
2. Copy the `DanZoom` folder into:
   `World of Warcraft/_retail_/Interface/AddOns/`
3. Restart the game or run `/reload`

## Settings
You can find the settings in:
`ESC → Options → AddOns → DanZoom`

### Settings → Zoom
* **Max Camera Zoom**
  Sets the maximum zoom-out factor.

* **Enable Minimum Zoom**
  Prevents zooming into first-person view.

* **Minimum Zoom Distance**
  Defines how close the camera is allowed to get.

### Settings → Others
* **Show Login Message**
  Shows current zoom settings in chat when logging in.

## Technical Notes
* Settings are stored in SavedVariables (`DanZoomDB`)
* Camera max zoom is applied via `cameraDistanceMaxZoomFactor` CVar
* Minimum zoom is enforced after zoom-in input using a debounced hook

## Status
Current version: **0.1**

Planned features:
* Preset system (quick zoom profiles)
* Optional profile-based settings
* Adding multiple languages

## License
MIT (or choose another license if needed)
