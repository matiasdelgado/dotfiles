set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim.git'
Plugin 'editorconfig/editorconfig-vim.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'elixir-lang/vim-elixir.git'
Plugin 'pangloss/vim-javascript.git'
Plugin 'mxw/vim-jsx.git'
Plugin 'tpope/vim-surround.git'
call vundle#end()
filetype plugin indent on

syntax enable
colorscheme gruvbox

runtime macros/matchit.vom

" Allow per-project configuration files
set exrc

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

set clipboard=unnamed

" Airline setup
let g:airline_theme='deus'

" CtrlP setup
if !empty(glob("~/.vimrc_ctrlp"))
  source ~/.vimrc_ctrlp
endif
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|'

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Clear search highlight
nnoremap <CR> :noh<CR><CR>:<backspace>
" Find selection
vnoremap // y/<C-R>"<CR>

" Disable unsafe commands in project-specific .vimrc files
set secure
