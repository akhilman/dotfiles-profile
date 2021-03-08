.DEFAULT_GOAL := install

fisher := functions/fisher.fish

$(fisher):
	curl https://git.io/fisher --create-dirs -sLo functions/fisher.fish

update: $(fisher)
	fish -c "fisher update"

install: $(fisher) update
