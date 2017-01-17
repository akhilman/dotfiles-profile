fisher = $(HOME)/.config/fish/functions/fisher.fish

all: init docker-fish-completion


docker-fish-completion: fisherman
	fish -c "fisher install barnybug/docker-fish-completion"


$(fisher): fisherman
	ln -s $(CURDIR)/fisherman/fisher.fish $(fisher)

fisherman:
	git clone https://github.com/fisherman/fisherman.git fisherman
