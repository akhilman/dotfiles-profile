.DEFAULT_GOAL := install

fisher := functions/fisher.fish

$(fisher):
	curl https://git.io/fisher --create-dirs -sLo functions/fisher.fish

run_fisher: $(fisher)
	fish -c fisher

install: $(fisher) run_fisher
