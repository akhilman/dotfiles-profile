set fish_color_user (functions -q hline_prompt_generate_color; and hline_prompt_generate_color $USER; or echo brgreen)
set fish_color_host (functions -q hline_prompt_generate_color; and hline_prompt_generate_color $hostname; or echo normal)
