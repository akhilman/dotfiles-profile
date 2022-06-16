.DEFAULT_GOAL := install

TEMP_FILE := $(shell mktemp --suffix .fish)

fisher := functions/fisher.fish

$(fisher):
	curl -L -o $(TEMP_FILE) https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish
	fish -c "source $(TEMP_FILE); and fisher install jorgebucaran/fisher"
	rm $(TEMP_FILE)

colorscheme:
	fish colorscheme.fish

update: $(fisher) colorscheme
	fish -c "fisher update"

install: $(fisher) update
