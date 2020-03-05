.DEFAULT_GOAL := install

fisher := functions/fisher.fish
prompt := functions/fish_hline_prompt.fish

$(fisher):
	curl https://git.io/fisher --create-dirs -sLo functions/fisher.fish

$(prompt): $(fisher)
	fish -c fisher add akhilman/fish-prompt-hline

install: $(fisher) $(prompt)
