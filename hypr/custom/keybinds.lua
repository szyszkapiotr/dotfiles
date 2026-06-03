hl.bind(
	"CTRL+SUPER+ALT+Slash",
	hl.dsp.exec_cmd("xdg-open ~/.config/hypr/custom/keybinds.lua"),
	{ description = "Edit user keybinds" }
)

hl.bind(
	"switch:on:Lid Switch",
	hl.dsp.exec_cmd("~/.config/hypr/custom/scripts/claimshell.lua close"),
	{ locked = true }
)
hl.bind(
	"switch:off:Lid Switch",
	hl.dsp.exec_cmd("~/.config/hypr/custom/scripts/claimshell.lua open"),
	{ locked = true }
)
