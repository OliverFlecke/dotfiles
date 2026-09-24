hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + CTRL + Q", hl.dsp.exec_cmd("noctalia msg session lock"))
-- Nuclear option to kill hyprland
hl.bind(
	"SUPER + CTRL + SHIFT + Q",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind("SUPER + SHIFT + D", hl.dsp.exec_cmd("hyprctl dispatch dpms on"))

-- Copy/paste
hl.bind("SUPER + SHIFT + c", hl.dsp.exec_cmd("noctalia msg panel-toggle clipboard"))
hl.bind("SUPER + v", hl.dsp.exec_cmd("wtype -k ctrl+v"))
hl.bind("SUPER + c", hl.dsp.exec_cmd("wtype -k ctrl+c"))

hl.bind("SUPER + SHIFT + 3", hl.dsp.exec_cmd("noctalia msg screenshot-fullscreen"))
hl.bind("SUPER + SHIFT + 4", hl.dsp.exec_cmd("noctalia msg screenshot-region"))
hl.bind("SUPER + SHIFT + 1", hl.dsp.exec_cmd("noctalia msg annotate"))

hl.bind("SUPER + S", hl.dsp.exec_cmd("noctalia msg settings-open"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("noctalia msg settings-close"))

-- Movement
hl.bind("ALT + j", hl.dsp.focus({ direction = "down" }))
hl.bind("ALT + k", hl.dsp.focus({ direction = "up" }))
hl.bind("ALT + h", hl.dsp.focus({ direction = "left" }))
hl.bind("ALT + l", hl.dsp.focus({ direction = "right" }))

hl.bind("ALT + SHIFT + j", hl.dsp.window.move({ direction = "down" }))
hl.bind("ALT + SHIFT + k", hl.dsp.window.move({ direction = "up" }))
hl.bind("ALT + SHIFT + h", hl.dsp.window.move({ direction = "left" }))
hl.bind("ALT + SHIFT + l", hl.dsp.window.move({ direction = "right" }))

hl.bind("ALT + SHIFT + f", hl.dsp.window.fullscreen({ mode = "maximized" }))

-- Wallpaper
hl.bind("SUPER + CTRL + w", hl.dsp.submap("wallpaper"))
hl.define_submap("wallpaper", function()
	hl.bind("n", hl.dsp.exec_cmd("noctalia msg wallpaper-next"))
	hl.bind("p", hl.dsp.exec_cmd("noctalia msg wallpaper-previous"))
	hl.bind("SHIFT + n", hl.dsp.exec_cmd("noctalia msg wallpaper-previous"))
	hl.bind("r", hl.dsp.exec_cmd("noctalia msg wallpaper-random"))

	hl.bind("w", hl.dsp.exec_cmd("~/.config/noctalia/change_wallpaper.sh ~/wallpaper/default"))
	hl.bind("o", hl.dsp.exec_cmd("~/.config/noctalia/change_wallpaper.sh ~/wallpaper/other"))
	hl.bind("a", hl.dsp.exec_cmd("~/.config/noctalia/change_wallpaper.sh ~/wallpaper/ai"))

	hl.bind("h", function()
		if hl.get_config("decoration.active_opacity") == 1 then
			hl.config({
				decoration = {
					active_opacity = 0.9,
					inactive_opacity = 0.8,
				},
			})
		else
			hl.config({
				decoration = {
					active_opacity = 1,
					inactive_opacity = 1,
				},
			})
		end
	end)

	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- macOS-style text editing keybindings
-- hl.bind("SUPER, C", hl.dsp.sendshortcut({ mods = "CTRL", key = "INSERT" }))
-- hl.bind("SUPER, V", hl.dsp.sendshortcut({ mods = "SHIFT", key = "INSERT" }))
-- hl.bind("SUPER, X", hl.dsp.sendshortcut({ mods = "CTRL", key = "X" }))
-- hl.bind("SUPER, A", hl.dsp.sendshortcut({ mods = "CTRL", key = "A" }))
-- hl.bind("SUPER, Z", hl.dsp.sendshortcut({ mods = "CTRL", key = "Z" }))
-- hl.bind("SUPER + SHIFT, Z", hl.dsp.sendshortcut({ mods = "CTRL", key = "Y" }))

-- Apps
-- hl.bind("SUPER + space", hl.dsp.exec_cmd("rofi -show drun -show-icons"))
-- hl.bind("SUPER + SHIFT + space", hl.dsp.exec_cmd("rofi -show run"))
hl.bind("SUPER + space", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))
hl.bind("SUPER + SHIFT + space", hl.dsp.exec_cmd("rofi -show run"))

hl.bind("SUPER + T", hl.dsp.exec_cmd("ghostty"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("nautilus"))
-- hl.bind("SUPER + R", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + P", hl.dsp.window.pseudo())

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
