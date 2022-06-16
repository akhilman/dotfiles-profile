.DEFAULT_GOAL := install

fisher := functions/fisher.fish

$(fisher):
	curl https://git.io/fisher --create-dirs -sLo functions/fisher.fish

colorscheme:
	fish colorscheme.fish

update: $(fisher) colorscheme
	fish -c "fisher update"

install: $(fisher) update
