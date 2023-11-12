if status is-login
		and functions -q bass
		and test -e $HOME/.profile
	bass source $HOME/.profile
end
