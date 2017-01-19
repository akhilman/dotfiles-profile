###
# Powerline
# set FISH_POWERLINE to 1 to enable
##
if begin
    status --is-interactive
    and [ -n "$FISH_POWERLINE" ]
    and [ "$COLORTERM" = "truecolor" ]
    and [ -e /usr/share/powerline/fish/powerline-setup.fish ]
end
	. /usr/share/powerline/fish/powerline-setup.fish
    powerline-daemon -q
    powerline-setup
end
