hl.on("hyprland.start", function()
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("noctalia")
	hl.exec_cmd("mako")
	hl.exec_cmd("playerctld daemon")
	hl.exec_cmd("hyprsunset")

	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Nordzy-cursors")
hl.env("HYPRCURSOR_THEME", "Nordzy-cursors")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("WLR_RENDERER_ALLOW_SOFTWARE", "1")

hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("LIBVA_NVIDIA_DRIVER_NAME", "nvidia")
hl.env("WLR_NO_HARDWARE_CURSORS", "1")
