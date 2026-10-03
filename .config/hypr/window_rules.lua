local vars = require("variables")

hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "move-vscode",
	match = {
		class = "code-oss",
	},
	workspace = vars.workspace.misc.name,
})

hl.window_rule({
	name = "move-thunar",
	match = {
		class = "thunar",
	},
	workspace = vars.workspace.utils.name,
})

hl.window_rule({

	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

hl.window_rule({
	name = "move-vivaldi",
	match = {
		class = "vivaldi-stable",
	},
	workspace = vars.workspace.browser.name,
})

hl.window_rule({
	name = "move-teams",
	match = {
		class = "teams-for-linux",
	},
	workspace = vars.workspace.utils.name,
})

hl.window_rule({
	name = "move-ghostty",
	match = {
		class = "com.mitchellh.ghostty",
	},
	workspace = vars.workspace.terminal.name,
})

hl.window_rule({
	name = "move-ytm",
	match = {
		class = "YouTube Music Desktop App",
	},
	workspace = vars.workspace.utils.name,
})

hl.window_rule({
	name = "move-rider",
	match = {
		class = "jetbrains-rider",
	},
	workspace = vars.workspace.rider.name,
})

hl.window_rule({
	name = "move-rider-tools",
	match = {
		class = "jetbrains-rider",
		title = "^(Debug|Services|Build|Tests|Git|Commit|Run) - .*$",
	},
	workspace = vars.workspace.rider_devtools.name,
})

hl.window_rule({
	name = "move-brune",
	match = {
		class = "bruno",
	},
	workspace = vars.workspace.utils.name,
})
