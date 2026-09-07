local terminal = "ghostty"
local fileManager = "dolphin"
local menu = "hyprlauncher"

hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + CTRL + Q", hl.dsp.exec_cmd("hyprlock"))
-- Nuclear option to kill hyprland
hl.bind(
	"SUPER + CTRL + SHIFT + Q",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind("SUPER + SHIFT + D", hl.dsp.exec_cmd("hyprctl dispatch dpms on"))

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
	hl.bind("w", hl.dsp.exec_cmd("killall hpaper; hpaper start ~/wallpaper/default"))
	hl.bind("o", hl.dsp.exec_cmd("killall hpaper; hpaper start ~/wallpaper/other"))

	hl.bind("n", hl.dsp.exec_cmd("hpaper next"))
	hl.bind("p", hl.dsp.exec_cmd("hpaper prev"))

	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Workspaces
hl.workspace_rule({ workspace = "terminal" })
hl.bind("ALT + t", hl.dsp.focus({ workspace = "terminal" }))
hl.bind("ALT + b", hl.dsp.focus({ workspace = "2" }))

-- Apps
hl.bind("SUPER + space", hl.dsp.exec_cmd("rofi -show drun -show-icons"))
hl.bind("SUPER + SHIFT + space", hl.dsp.exec_cmd("rofi -show run"))

hl.bind("SUPER + T", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + R", hl.dsp.exec_cmd(menu))
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
