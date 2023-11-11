function dnf --description 'Force global cache for dnf for regular users'
	if string match -eq (whoami) root
		command dnf $argv
	else
		command dnf -C $argv
	end
end
