if status is-login
		and functions -q bass
		and $HOME/.profile
	bass source $HOME/.profile
end
