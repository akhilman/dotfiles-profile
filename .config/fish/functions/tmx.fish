function tmx --description 'Create or attach to tmux sesssion' --argument session
	if [ -z $session ]
		set session main
	end
	cd ~
	tmux new-session -A -s $session
end
