# name: ayu Dark modified
# url: 'https://github.com/dempfi/ayu'
# preferred_background: 161616

set -U fish_color_normal B3B1AD
set -U fish_color_command 39BAE6
set -U fish_color_quote C2D94C
set -U fish_color_redirection FFEE99
set -U fish_color_end F29668
set -U fish_color_error FF3333
set -U fish_color_param B3B1AD
set -U fish_color_comment 626A73
set -U fish_color_match F07178
set -U fish_color_selection --background=7c5a16
set -U fish_color_search_match --background=7c5a16
set -U fish_color_history_current --bold
set -U fish_color_operator 7c5a16
set -U fish_color_escape 95E6CB
set -U fish_color_cwd 59C2FF
set -U fish_color_cwd_root red
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion 4D5566
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel -r
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D yellow
set -U fish_pager_color_prefix normal --bold --underline
set -U fish_pager_color_progress brwhite --background=cyan
set -U fish_pager_color_selected_background --background=7c5a16
set -U fish_color_option B3B1AD
set -U fish_color_keyword 39BAE6

# Setup right prompt colors
set -U fish_color_duration blue
set -U fish_color_hline grey  # if not generated
set -U fish_color_njobs green
set -U fish_color_status --background red white
set -U fish_color_time white
set -U fish_color_vcs yellow  # if not generated
set -U fish_color_venv magenta  # if not generated

# Enable generated colors
set -U fish_generate_color_cwd 1
set -U fish_generate_color_hline 1
set -U fish_generate_color_host 1
set -U fish_generate_color_user 1
set -U fish_generate_color_vcs 1
set -U fish_generate_color_venv 1

# Adjust generated colors
set -U fish_generated_color_hue_offset 250  # 0 <= H <= 360
set -U fish_generated_color_saturation 25  # 0 <= S <= 100
set -U fish_generated_color_value 80  # 0 <= V <= 100
