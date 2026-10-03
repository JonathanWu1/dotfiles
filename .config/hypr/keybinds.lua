local vars = require("variables")

local mainMod = vars.commands.mainMod
local shift = vars.commands.shift
local enter = vars.commands.enter
local tab = vars.commands.tab
local shutdown = vars.commands.shutdown
local rofi = vars.commands.rofi
local workspace = vars.workspace

hl.bind(mainMod .. enter, hl.dsp.exec_cmd("ghostty"))
hl.bind(mainMod .. shift .. "X", hl.dsp.window.close())
hl.bind(mainMod .. shift .. "F12", hl.dsp.exec_cmd(shutdown))
hl.bind(mainMod .. "F12", hl.dsp.exec_cmd("hyprlock"))
hl.bind("F1", hl.dsp.exec_cmd(rofi.drun))
hl.bind("F2", hl.dsp.exec_cmd(rofi.clip))
hl.bind("F3", hl.dsp.exec_cmd(rofi.calc))
hl.bind(mainMod .. "F", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mainMod .. tab, hl.dsp.layout("cyclenext"))
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy --type image/png'))

hl.bind(mainMod .. "H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. "J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. "K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. "L", hl.dsp.focus({ direction = "right" }))
hl.bind("mouse:276", hl.dsp.focus({ direction = "up" }))
hl.bind("mouse:275", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. shift .. "H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. shift .. "J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. shift .. "K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. shift .. "L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. "mouse:276", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. "mouse:275", hl.dsp.window.move({ direction = "right" }))

for _, ws in pairs(workspace) do
	hl.bind(mainMod .. ws.key, hl.dsp.focus({ workspace = ws.name }))
	hl.bind(mainMod .. shift .. ws.key, hl.dsp.window.move({ workspace = ws.name }))
	hl.workspace_rule({
		workspace = ws.name,
		monitor = ws.monitor,
		layout = ws.layout,
	})
end

-- hl.workspace_rule({
-- 	workspace = workspace.rider_devtools.name,
-- 	layout = workspace.rider_devtools.layout,
-- 	layout_opts = {
-- 		orientation = "bottom",
-- 	},
-- })

hl.bind(mainMod .. "mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. "mouse:273", hl.dsp.window.resize())

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"))

-- media (locked)
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
