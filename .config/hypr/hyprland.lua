local terminal = "ghostty"
local fileManager = "dolphin"
local menu = "rofi -show run"

local workspace = {
	terminal = { name = "1", key = "1", monitor = "DP-1", layout = "master" },
	rider = { name = "2", key = "2", monitor = "DP-1", layout = "monocle" },
	browser = { name = "3", key = "3", monitor = "DP-1" },
	misc = { name = "4", key = "4", monitor = "DP-1" },
	utils = { name = "5", key = "q", monitor = "DP-2" },
	extra1 = { name = "6", key = "r", monitor = "DP-2" },
	extra2 = { name = "7", key = "t", monitor = "DP-2" },
	rider_devtools = { name = "8", key = "w", monitor = "DP-7", layout = "master" },
}

hl.env("XCURSOR_SIZE", 14)
hl.env("HYPRCURSOR_SIZE", 14)
hl.env("XCURSOR_THEME", "Adwaita")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

hl.on("hyprland.start", function()
	hl.exec_cmd("systemctl --user start hyprland-session.target")
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("wl-paste --watch cliphist store")
	hl.exec_cmd("hypridle")
end)

hl.config({
	general = {
		border_size = 1,
		gaps_in = 5,
		gaps_out = 20,
		float_gaps = 0,
		gaps_workspaces = 0,
		col = {
			inactive_border = { colors = { "rgba(595959aa)" } },
			active_border = { colors = { "rgba(33ccffee)" } },
			nogroup_border = { colors = { "rgb(255, 170, 255)" } },
			nogroup_border_active = { colors = { "rgb(255, 0, 255)" } },
		},
		layout = "dwindle",
		no_focus_fallback = true,
		resize_on_border = true,
		extend_border_grab_area = 15,
		hover_icon_on_border = true,
		allow_tearing = false,
		resize_corner = 0,
		modal_parent_blocking = true,
		locale = "",
		snap = {
			enabled = false,
			window_gap = 10,
			monitor_gap = 10,
			border_overlap = false,
			respect_gaps = false,
		},
	},
	decoration = {
		rounding = 10,
		rounding_power = 2.0,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		fullscreen_opacity = 1.0,
		dim_modal = true,
		dim_inactive = false,
		dim_strength = 0.5,
		dim_special = 0.2,
		dim_around = 0.4,
		screen_shader = "",
		border_part_of_window = true,

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			ignore_opacity = true,
			new_optimizations = true,
			xray = false,
			noise = 0.0117,
			contrast = 0.8916,
			brightness = 0.8172,
			vibrancy = 0.1696,
			vibrancy_darkness = 0.0,
			special = false,
			popups = false,
			popups_ignorealpha = 0.2,
			input_methods = false,
			input_methods_ignorealpha = 0.2,
		},
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			sharp = false,
			color = "rgba(1a1a1aee)",
			color_inactive = nil,
			offset = { 0, 0 },
			scale = 1.0,
		},
	},
	animations = {
		enabled = true,
		workspace_wraparound = false,
	},
	input = {
		kb_model = "",
		kb_layout = "us",
		kb_variant = "",
		kb_options = "",
		kb_rules = "",
		kb_file = "",
		numlock_by_default = true,
		resolve_binds_by_sym = false,
		repeat_rate = 25,
		repeat_delay = 600,
		sensitivity = -0.4,
		accel_profile = "",
		force_no_accel = false,
		rotation = 0,
		left_handed = false,
		scroll_points = "",
		scroll_method = "",
		scroll_button = 0,
		scroll_button_lock = false,
		scroll_factor = 1.0,
		natural_scroll = false,
		follow_mouse = 0,
		follow_mouse_shrink = 0,
		follow_mouse_threshold = 0.0,
		focus_on_close = 0,
		mouse_refocus = true,
		float_switch_override_focus = 1,
		special_fallthrough = false,
		off_window_axis_events = 1,
		emulate_discrete_scroll = 1,

		touchpad = {
			disable_while_typing = true,
			natural_scroll = true,
			scroll_factor = 1.0,
			middle_button_emulation = false,
			tap_button_map = "",
			clickfinger_behavior = false,
			tap_to_click = true,
			drag_lock = 0,
			tap_and_drag = true,
			flip_x = false,
			flip_y = false,
			drag_3fg = 0,
		},
	},
	group = {
		auto_group = true,
		insert_after_current = true,
		focus_removed_window = true,
		drag_into_group = 1,
		merge_groups_on_drag = true,
		merge_groups_on_groupbar = true,
		merge_floated_into_tiled_on_groupbar = false,
		group_on_movetoworkspace = false,
		col = {
			border_active = "rgba(66ffff00)",
			border_inactive = "rgba(66777700)",
			border_locked_active = "rgba(66ff5500)",
			border_locked_inactive = "rgba(66775500)",
		},

		groupbar = {
			enabled = false,
			font_family = "Empty",
			font_size = 14,
			font_weight_active = "bold",
			font_weight_inactive = "normal",
			gradients = false,
			height = 18,
			indicator_gap = 5,
			indicator_height = 0,
			stacked = false,
			priority = 3,
			render_titles = true,
			text_offset = 0,
			text_padding = 0,
			scrolling = true,
			rounding = 1,
			rounding_power = 2.0,
			gradient_rounding = 2,
			gradient_rounding_power = 2.0,
			round_only_edges = true,
			gradient_round_only_edges = true,
			text_color = "rgba(ffffffff)",
			text_color_inactive = nil,
			text_color_locked_active = nil,
			text_color_locked_inactive = nil,
			col = {
				active = "rgba(66ffff00)",
				inactive = "rgba(66777700)",
				locked_active = "rgba(66ff5500)",
				locked_inactive = "rgba(66775500)",
			},
			gaps_in = 2,
			gaps_out = 2,
			keep_upper_gap = true,
			middle_click_close = true,
			blur = false,
		},
	},

	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		disable_scale_notification = false,
		col = {
			splash = "rgba(ffffffff)",
		},
		font_family = "Sans",
		splash_font_family = "",
		force_default_wallpaper = -1,
		vrr = 0,
		mouse_move_enables_dpms = false,
		key_press_enables_dpms = false,
		name_vk_after_proc = true,
		always_follow_on_dnd = true,
		layers_hog_keyboard_focus = true,
		animate_manual_resizes = false,
		animate_mouse_windowdragging = false,
		disable_autoreload = false,
		enable_swallow = false,
		swallow_regex = "",
		swallow_exception_regex = "",
		focus_on_activate = false,
		mouse_move_focuses_monitor = true,
		allow_session_lock_restore = false,
		session_lock_xray = false,
		background_color = "rgb(111111)",
		close_special_on_empty = true,
		on_focus_under_fullscreen = 2,
		exit_window_retains_fullscreen = false,
		initial_workspace_tracking = 1,
		middle_click_paste = true,
		render_unfocused_fps = 15,
		disable_xdg_env_checks = false,
		--disable_hyprland_qtutils_check = false,
		lockdead_screen_delay = 1000,
		enable_anr_dialog = true,
		anr_missed_pings = 5,
		size_limits_tiled = false,
		disable_watchdog_warning = false,
	},

	layout = {
		single_window_aspect_ratio = { 0, 0 },
		single_window_aspect_ratio_tolerance = 0.1,
	},

	binds = {
		pass_mouse_when_bound = false,
		scroll_event_delay = 300,
		workspace_back_and_forth = false,
		hide_special_on_workspace_change = false,
		allow_workspace_cycles = false,
		workspace_center_on = 0,
		focus_preferred_method = 0,
		ignore_group_lock = false,
		movefocus_cycles_fullscreen = false,
		movefocus_cycles_groupfirst = false,
		window_direction_monitor_fallback = true,
		disable_keybind_grabbing = false,
		allow_pin_fullscreen = false,
		drag_threshold = 0,
	},
	xwayland = {
		enabled = true,
		use_nearest_neighbor = true,
		force_zero_scaling = false,
		create_abstract_socket = false,
	},
	opengl = {
		nvidia_anti_flicker = true,
	},

	render = {
		direct_scanout = 0,
		expand_undersized_textures = true,
		xp_mode = false,
		ctm_animation = 2,
		cm_enabled = true,
		send_content_type = true,
		cm_auto_hdr = 1,
		new_render_scheduling = false,
		non_shader_cm = 2,
		non_shader_cm_interop = 2,
		cm_sdr_eotf = "default",
		commit_timing_enabled = true,
		use_fp16 = 2,
		keep_unmodified_copy = 2,
		use_shader_blur_blend = false,
	},

	cursor = {
		invisible = false,
		sync_gsettings_theme = true,
		no_hardware_cursors = 1,
		no_break_fs_vrr = 2,
		min_refresh_rate = 24,
		hotspot_padding = 1,
		inactive_timeout = 0,
		no_warps = false,
		persistent_warps = false,
		warp_on_change_workspace = 0,
		warp_on_toggle_special = 0,
		default_monitor = [[Empty]],
		zoom_factor = 1.0,
		zoom_rigid = false,
		zoom_detached_camera = true,
		enable_hyprcursor = true,
		hide_on_key_press = false,
		hide_on_touch = true,
		hide_on_tablet = true,
		use_cpu_buffer = 2,
		warp_back_after_non_mouse_input = false,
		zoom_disable_aa = false,
	},

	ecosystem = {
		no_update_news = false,
		no_donation_nag = false,
		enforce_permissions = false,
	},

	quirks = {
		prefer_hdr = 0,
	},

	debug = {
		overlay = false,
		damage_blink = false,
		gl_debugging = false,
		vfr = true,
		disable_logs = true,
		disable_time = true,
		damage_tracking = 2,
		enable_stdout_logs = false,
		manual_crash = 0,
		suppress_errors = false,
		--watchdog_timeout = 5,
		disable_scale_checks = false,
		error_limit = 5,
		error_position = 0,
		colored_stdout_logs = true,
		pass = false,
		full_cm_proto = false,
		invalidate_fp16 = 2,
	},

	master = {
		new_status = "slave",
		always_keep_position = true,
		orientation = "right",
		mfact = 0.70,
		allow_small_split = false,
		special_scale_factor = 1,
		new_on_top = false,
		new_on_active = "none",
		slave_count_for_center_master = 2,
		center_master_fallback = "left",
		smart_resizing = true,
		drop_at_cursor = true,
		--focus_master_on_close = false,
	},

	scrolling = {
		fullscreen_on_one_column = true,
		column_width = 0.5,
		focus_fit_method = 1,
		follow_focus = true,
		follow_min_visible = 0.4,
		explicit_column_widths = "0.333, 0.5, 0.667, 1.0",
		wrap_focus = true,
		wrap_swapcol = true,
		direction = "down",
	},

	dwindle = {
		force_split = 0,
		preserve_split = true,
		smart_split = false,
		smart_resizing = true,
		permanent_direction_override = false,
		special_scale_factor = 1,
		split_width_multiplier = 1.0,
		use_active_for_splits = true,
		default_split_ratio = 1.0,
		split_bias = 0,
		precise_mouse_move = false,
	},
})

hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 2.5, bezier = "quick" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

local mainMod = "SUPER + "
local shift = "SHIFT + "
local enter = "RETURN + "
local tab = "TAB + "
local shutdown = "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"

local rofi = {
	log = " -log ~/rofi.log",
	drun = "rofi -show drun",
	clip = "cliphist list | rofi -dmenu | cliphist decode | wl-copy",
	calc = "rofi -show calc -modi calc -no-show-match -no-sort",
}

hl.bind(mainMod .. enter, hl.dsp.exec_cmd("ghostty"))
hl.bind(mainMod .. shift .. "X", hl.dsp.window.close())
hl.bind(mainMod .. shift .. "F12", hl.dsp.exec_cmd(shutdown))
hl.bind(mainMod .. "F12", hl.dsp.exec_cmd("hyprlock"))
hl.bind("F1", hl.dsp.exec_cmd(rofi.drun))
hl.bind("F2", hl.dsp.exec_cmd(rofi.clip))
hl.bind("F3", hl.dsp.exec_cmd(rofi.calc))
hl.bind(mainMod .. "F", hl.dsp.window.fullscreen)
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

hl.workspace_rule({
	workspace = workspace.rider_devtools.name,
	layout = workspace.rider_devtools.layout,
	layout_opts = {
		orientation = "bottom",
	},
})

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

hl.monitor({
	output = "DP-1",
	mode = "3840x2160@120",
	position = "0x0",
	scale = 1,
})

hl.monitor({
	output = "DP-2",
	mode = "3840x2160@60",
	position = "3840x0",
	scale = 1,
})

hl.monitor({
	output = "DP-7",
	mode = "1920x1080@60",
	position = "-1080x0",
	scale = 1,
	transform = 1,
})

hl.monitor({
	output = "DP-8",
	mode = "1920x1080@60",
	position = "-1080x0",
	scale = 1,
	transform = 1,
})

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
	workspace = workspace.misc.name,
})

hl.window_rule({
	name = "move-thunar",
	match = {
		class = "thunar",
	},
	workspace = workspace.utils.name,
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
	workspace = workspace.browser.name,
})

hl.window_rule({
	name = "move-teams",
	match = {
		class = "teams-for-linux",
	},
	workspace = workspace.utils.name,
})

hl.window_rule({
	name = "move-ghostty",
	match = {
		class = "com.mitchellh.ghostty",
	},
	workspace = workspace.terminal.name,
})

hl.window_rule({
	name = "move-ytm",
	match = {
		class = "YouTube Music Desktop App",
	},
	workspace = workspace.utils.name,
})

hl.window_rule({
	name = "move-rider",
	match = {
		class = "jetbrains-rider",
	},
	workspace = workspace.rider.name,
})

hl.window_rule({
	name = "move-rider-tools",
	match = {
		class = "jetbrains-rider",
		title = "^(Debug|Services|Build|Tests|Git|Commit|Run) - .*$",
	},
	workspace = workspace.rider_devtools.name,
})

hl.window_rule({
	name = "move-brune",
	match = {
		class = "bruno",
	},
	workspace = workspace.utils.name,
})
