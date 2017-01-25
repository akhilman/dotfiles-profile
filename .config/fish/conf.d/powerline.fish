###
# Powerline
# set FISH_POWERLINE to 1 to enable
##

set -l setup_script

if [ -e /usr/share/powerline/fish/powerline-setup.fish ]
    # Fedora
    set setup_script /usr/share/powerline/fish/powerline-setup.fish
else if [ -e /usr/share/powerline/bindings/fish/powerline-setup.fish ]
    # Debian
    set setup_script /usr/share/powerline/bindings/fish/powerline-setup.fish
end

if begin
    status --is-interactive
    and [ -n "$FISH_POWERLINE" ]
    and [ -n "$setup_script" ]
    and [ "$COLORTERM" = "truecolor" ]
end
	. $setup_script
    powerline-daemon -q
    powerline-setup
end
