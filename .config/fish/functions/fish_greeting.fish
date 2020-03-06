function fish_greeting

    # last logins
	if which last > /dev/null 2>&1; and [ -r /var/log/wtmp ]
        last -w3
    end

    # mail
    set -l have_a_mail
    if which mail > /dev/null 2>&1
        set have_a_mail (echo quit | mail 2> /dev/null | sed -n 's/.*: \([0-9]* messages*\).*/\1/p')
    end
    if [ -n "$have_a_mail"  ]
        set_color red
        printf "You have $have_a_mail\n"
        set_color normal
    end

end
