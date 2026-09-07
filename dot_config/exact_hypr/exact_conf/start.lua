hl.on("hyprland.start", function()
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("hyprpaper & hpaper start ~/wallpaper/")
	hl.exec_cmd("hyprlock")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprsunset")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("WLR_RENDERER_ALLOW_SOFTWARE", "1")
