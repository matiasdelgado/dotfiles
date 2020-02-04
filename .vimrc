set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'elixir-lang/vim-elixir.git'
Plugin 'pangloss/vim-javascript.git'
Plugin 'mxw/vim-jsx.git'
Plugin 'tpope/vim-surround.git'
Plugin 'SirVer/ultisnips.git'
Plugin 'leafgarland/typescript-vim'
Plugin 'janko-m/vim-test'
Plugin 'prettier/vim-prettier'
Plugin 'junegunn/fzf.vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'mattn/emmet-vim'
Plugin 'keith/swift.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'dense-analysis/ale'
call vundle#end()
filetype plugin indent on

set rtp+=/usr/local/opt/fzf

set encoding=utf-8

syntax enable
colorscheme gruvbox
set background=dark

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

" set showbreak=↪\ 
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:·
set list

map <C-J> :bnext<CR>
map <C-K> :bprev<CR>

set splitbelow
set splitright

set clipboard=unnamed

" Airline setup
let g:airline_theme='deus'

runtime! custom/*.vim

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

" Replace selection
vnoremap <leader>ss y:%s/<C-R>"//g<left><left>

" Open file explorer
nmap <silent> <leader>e :Ex<CR>

" Allow uppercase commands for saving and quitting
command W w
command Q q

" Open file in browser
nmap <silent> <leader>w :!open % -a Google\ Chrome<CR><CR>

" Replace currently selected text with default register without yanking it
vnoremap <leader>p "_dP

" Disable unsafe commands in project-specific .vimrc files
set secure
