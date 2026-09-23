hl.bind("SUPER + Q", hl.dsp.exec_cmd("alacritty"))
hl.bind("SUPER + R", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ "repeating", "locked" }
)
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { "repeating", "locked" })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { "locked" })

hl.bind("SUPER + C", hl.dsp.window.close())

hl.bind("SUPER + H", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "d" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "r" }))

hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "r" }))

hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

for i = 1, 10 do
	local key = i % 10
	hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))

	hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.config({
	input = {
		kb_layout = "us,ru",

		kb_options = "grp:alt_shift_toggle",

		resolve_binds_by_sym = 1,

		follow_mouse = 1,
		sensitivity = 0,
	},
	animations = {
		enabled = true,
	},

	general = {
		border_size = 2,
		resize_on_border = true,
		col = {
			active_border = "#676767",
			inactive_border = "#323232",
		},
	},

	decoration = {
		rounding = 8,
	},
})

hl.on("hyprland.start", function()
	hl.exec_cmd("noctalia")
end)
