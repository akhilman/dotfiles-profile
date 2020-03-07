function sudo
    set_color -r $fish_color_cwd_root
    echo -n (prompt_pwd) \$ sudo
    set_color normal
    set_color $fish_color_cwd_root
    echo " $argv"
    set_color normal
    command sudo $argv
end
