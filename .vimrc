set runtimepath^=~/.vim/bundle/ctrlp.vim
execute pathogen#infect()

syntax enable
filetype plugin indent on

runtime macros/matchit.vom

set nowrap
set hlsearch
set showcmd
set showmode

set backspace=indent,eol,start

set hidden

set wildmenu
set wildmode=list:longest

set ignorecase
set smartcase

set number
set ruler

set softtabstop=2
set expandtab
set shiftwidth=2

map <C-J> :bnext<CR>
map <C-K> :bprev<CR>

set splitbelow
set splitright

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif
