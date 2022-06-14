function tmless --description 'Show tmux log in pager'
	tmux capture-pane -S -
		and tmux save-buffer - | less
end
