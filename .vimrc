source $HOME/.vim/vimrc/vundle.vim
source $HOME/.vim/vimrc/keymaps.vim
source $HOME/.vim/vimrc/tab_spaces.vim
source $HOME/.vim/vimrc/search.vim

set nocompatible
behave xterm
filetype plugin indent on
syntax on
set ic

" Source a local vimrc if it exists
if filereadable(expand("$HOME/.vimrc.local"))
  source $HOME/.vimrc.local
endif
