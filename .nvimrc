set nocompatible
filetype off
call plug#begin(stdpath('data') . '/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'elixir-lang/vim-elixir'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'janko-m/vim-test'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'branch': 'release/0.x' }
Plug 'junegunn/fzf.vim'
Plug 'slim-template/vim-slim'
Plug 'mattn/emmet-vim'
Plug 'dense-analysis/ale'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'ruanyl/vim-gh-line'
Plug 'zivyangll/git-blame.vim'
Plug 'tommcdo/vim-exchange'
call plug#end()

filetype plugin indent on

set rtp+=/usr/local/opt/fzf

set encoding=utf-8

syntax enable

if (has("termguicolors"))
  set termguicolors " enable true colors support
endif
let g:dracula_colorterm = 0
let g:dracula_italic = 1
colorscheme dracula

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
set relativenumber
set ruler

set softtabstop=2
set expandtab
set shiftwidth=2

set listchars=tab:‚Üí\ ,eol:‚Ü≤,nbsp:‚ê£,trail:¬∑
set list

" Show search count
set shortmess-=S

map <C-J> :bnext<CR>
map <C-K> :bprev<CR>

set splitbelow
set splitright

set clipboard=unnamed
nmap yfn :let @*=expand("%")<CR>
nmap yfp :let @*=expand("%:p")<CR>

" Airline setup
let g:airline_theme='dracula'
let g:airline_powerline_fonts=1

runtime! custom/*.vim

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Keep the current directory the same as the browsing directory
" let g:netrw_keepdir=0 " Fixes netrw cp/mv, but makes Rg to search in the current directory
let g:netrw_banner=0

" Clear search highlight
nnoremap <CR> :noh<CR><CR>:<backspace>
" Find selection
vnoremap // y/<C-R>"<CR>

" Replace selection
vnoremap <leader>ss y:%s/<C-R>"//g<left><left>

" Open file explorer
nmap <silent> <leader>e :Ex<CR>

" Allow uppercase commands
command W w
command Q q
command Qa qa
command Wa wa
command Tabe tabe

" Open file in browser
nmap <silent> <leader>w :!open % -a Microsoft\ Edge<CR><CR>

" Replace currently selected text with default register without yanking it
vnoremap <leader>p "_dP

" Disable unsafe commands in project-specific .vimrc files
set secure
