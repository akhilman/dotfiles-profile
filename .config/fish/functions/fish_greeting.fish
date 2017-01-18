function fish_greeting
	last -w3 $whami | head -n 3;
    set have_a_mail (echo quit | mail 2> /dev/null | sed -n 's/.*: \([0-9]* messages*\).*/\1/p')
    if [ ! -z "$have_a_mail"  ]
        set color red
        printf "You have $have_a_mail\n"
        set color normal
    end
end
