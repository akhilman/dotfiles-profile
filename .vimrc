" Use same settings as Neovim

if filereadable(expand("~/.config/nvim/basic.vim"))
  source ~/.config/nvim/basic.vim
endif

if filereadable(expand("~/.config/nvim/default_colorscheme.vim"))
  source ~/.config/nvim/default_colorscheme.vim
endif
