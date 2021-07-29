import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders

spacingConfig = spacingRaw True (Border 0 0 0 0) True (Border 3 3 3 3) True $ layoutHook def

main :: IO()
main =  xmonad $ def
	{ modMask 	     = mod1Mask 				-- Setting mod key to 'alt'
	, layoutHook	     = spacingConfig ||| noBorders Full		-- Included a no-border Full layout
	, startupHook 	     = spawn "autorun"				-- Starts up tlp, powertop, picom and theme-init
	, borderWidth        = 1
	, terminal           = "alacritty"
	, normalBorderColor  = "#111111"
	, focusedBorderColor = "#333333" }
	`additionalKeysP` [
		("M-r", spawn "rofi -show run"),			-- Rofi run keybind
		("M-b", spawn "firefox"),
		("M-w", spawn "theme-init"),
		("M-f", spawn "Thunar"),				-- File Manager Keybind
		("<XF86MonBrightnessUp>", spawn "xbacklight -inc 5"),
		("<XF86MonBrightnessDown>", spawn "xbacklight -dec 5")
	] 
	`additionalMouseBindings` [
		((0,2), const $ spawn "~/scripts/right-click-menu") 	-- Brings up rofi run menu on middle click
	]

