function __fish_bell_on_prompt --on-event fish_prompt
	if test -n "$CMD_DURATION" -a "$CMD_DURATION" -gt 10000
		printf "\a"
	end
end

