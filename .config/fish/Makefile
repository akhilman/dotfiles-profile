fishermandir = $(HOME)/.config/fisherman
funcdir = $(HOME)/.config/fish/functions


# meta

all: $(funcdir)/fisher.fish $(funcdir)/docker.fish

clean:
	fish -c "fisher ls | fisher rm"


# plugins

$(funcdir)/docker.fish: $(funcdir)/fisher.fish
	fish -c "fisher install barnybug/docker-fish-completion"


# fisherman

$(funcdir)/fisher.fish: $(fishermandir)/fisherman
	mkdir -p $(funcdir)
	ln -s $(fishermandir)/fisherman/fisher.fish $(funcdir)/fisher.fish

$(fishermandir)/fisherman:
	mkdir -p $(fishermandir)
	git clone https://github.com/fisherman/fisherman.git $(fishermandir)/fisherman
