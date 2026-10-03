local monitor1 = "eDP-1"
local monitor2 = "HDMI-A-1"

return {
	workspace = {
		terminal = { name = "1", key = "1", monitor = monitor2, layout = "master" },
		rider = { name = "2", key = "2", monitor = monitor2, layout = "monocle" },
		browser = { name = "3", key = "3", monitor = monitor2 },
		misc = { name = "4", key = "4", monitor = monitor2 },
		utils = { name = "5", key = "q", monitor = monitor1, layout = "master" },
		extra1 = { name = "6", key = "r", monitor = monitor2 },
		extra2 = { name = "7", key = "t", monitor = monitor1 },
		rider_devtools = { name = "8", key = "w", monitor = monitor1, layout = "master" },
	},
	terminal = "ghostty",
	fileManager = "dolphin",
	menu = "rofi -show run",
	monitor1 = monitor1,
	monitor2 = monitor2,
	commands = {
		mainMod = "SUPER + ",
		shift = "SHIFT + ",
		enter = "RETURN + ",
		tab = "TAB + ",
		shutdown = "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit",
		rofi = {
			log = " -log ~/rofi.log",
			drun = "rofi -show drun",
			clip = "cliphist list | rofi -dmenu | cliphist decode | wl-copy",
			calc = "rofi -show calc -modi calc -no-show-match -no-sort",
		},
	},
}
