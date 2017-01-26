fishermandir = $(HOME)/.config/fisherman
funcdir = $(HOME)/.config/fish/functions


# meta

default: install

install: $(funcdir)/fisher.fish \
	$(fishermandir)/docker-fish-completion \
	$(fishermandir)/prompt-hline \

update: install
	fish -c "fisher up"

uninstall:
	fish -c "fisher ls | fisher rm"


# plugins

$(fishermandir)/docker-fish-completion: $(funcdir)/fisher.fish
	fish -c "fisher install barnybug/docker-fish-completion"

$(fishermandir)/prompt-hline: $(funcdir)/fisher.fish
	fish -c "fisher install akhilman/fish-prompt-hline"


# fisherman

$(funcdir)/fisher.fish: $(fishermandir)/fisherman
	mkdir -p $(funcdir)
	ln -s $(fishermandir)/fisherman/fisher.fish $(funcdir)/fisher.fish

$(fishermandir)/fisherman:
	mkdir -p $(fishermandir)
	git clone https://github.com/fisherman/fisherman.git $(fishermandir)/fisherman
