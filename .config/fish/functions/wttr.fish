function wttr --description 'Show weather' --argument place
	if [ -z $place ]
		set place kemerovo
	end
	curl wttr.in/$place | less -R
end
