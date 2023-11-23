###
# Setting title for XTerm
##

function fish_title

	set -l title

	if [ $_ = 'fish' ]
		set title (prompt_pwd)
	else
		set title "$argv"
	end

	echo $title

end
