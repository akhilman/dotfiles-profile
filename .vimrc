" Use same settings as Neovim

if filereadable(expand("~/.config/nvim/basic.vim"))
  source ~/.config/nvim/basic.vim
endif

if filereadable(expand("~/.config/nvim/colorscheme.vim"))
  source ~/.config/nvim/colorscheme.vim
endif
