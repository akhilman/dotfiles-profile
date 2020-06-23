###
# Setting title for XTerm
##

function fish_title

    set -l title

    if [ $_ = 'fish' ]
        set title (prompt_pwd)
        if [ (string length "$title") -gt 15 ]
            set title ..(string sub --start -13 "$title")
        end
    else
        set title "$argv"
        if [ (string length "$title") -gt 15 ]
            set title (string sub --start -13 "$title")...
        end
    end

    echo $title

end
