# Apply color scheme
echo y | fish_config theme save "ayu Dark modified"

# Setup right prompt colors
set -U fish_color_duration blue
set -U fish_color_hline grey  # if not generated
set -U fish_color_njobs green
set -U fish_color_status --background red white
set -U fish_color_time white
set -U fish_color_vcs yellow  # if not generated
set -U fish_color_venv magenta  # if not generated

# Enable generated colors
set -U hline_generate_color_cwd 1
set -U hline_generate_color_hline 1
set -U hline_generate_color_host 1
set -U hline_generate_color_user 1
set -U hline_generate_color_vcs 1
set -U hline_generate_color_venv 1

# Adjust generated colors
set -U hline_generated_color_hue_offset 250  # 0 <= H <= 360
set -U hline_generated_color_saturation 25  # 0 <= S <= 100
set -U hline_generated_color_value 80  # 0 <= V <= 100
