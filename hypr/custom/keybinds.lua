-- This file will not be overwritten across dots-hyprland updates.
-- The file name is for the sake of organization and does not matter
-- See the corresponding files in ~/.config/hypr/hyprland for examples

hl.bind("switch:on:Lid Switch",
    hl.dsp.exec_cmd("~/.config/hypr/custom/scripts/claimshell.sh close"),
    { locked = true })
hl.bind("switch:off:Lid Switch",
    hl.dsp.exec_cmd("~/.config/hypr/custom/scripts/claimshell.sh open"),
    { locked = true })
