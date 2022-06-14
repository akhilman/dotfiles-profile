function fish_greeting

	# last logins
	if which last > /dev/null 2>&1; and [ -r /var/log/wtmp ]
		last -w3
	end

	# mail
	set -l new_mail_count
	if which mail > /dev/null 2>&1
		set new_mail_count (echo quit | mail 2> /dev/null | sed -n 's/.*: \([0-9]*\) messages*.*/\1/p')
	end
	if [ \( -n "$new_mail_count" \) -a \( "$new_mail_count" -gt 0 \) ]
		set_color red
		if [ $new_mail_count -eq 1 ]
			printf "You have a message\n"
		else
			printf "You have $new_mail_count messages\n"
end
		set_color normal
	end

end
