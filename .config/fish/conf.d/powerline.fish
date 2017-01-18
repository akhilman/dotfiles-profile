###
# Powerline
##
if status --is-interactive
 		and [ "$COLORTERM" = "truecolor" ]
		and [ -e /usr/share/powerline/fish/powerline-setup.fish ]
	. /usr/share/powerline/fish/powerline-setup.fish
	powerline-setup
end
