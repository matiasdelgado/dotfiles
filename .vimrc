
set nocompatible
filetype off
call plug#begin()
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'elixir-lang/vim-elixir'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'SirVer/ultisnips'
Plug 'janko-m/vim-test', { 'on': ['TestNearest', 'TestLast', 'TestFile', 'TestSuite', 'TestVisit'] }
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'branch': 'release/0.x' }
Plug 'junegunn/fzf.vim'
Plug 'slim-template/vim-slim'
Plug 'mattn/emmet-vim'
Plug 'dense-analysis/ale'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'kshenoy/vim-signature'
Plug 'jiangmiao/auto-pairs'
Plug 'ruanyl/vim-gh-line'
Plug 'zivyangll/git-blame.vim'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'skywind3000/asyncrun.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'tpope/vim-fugitive'
call plug#end()

filetype plugin indent on

set rtp+=/usr/local/opt/fzf

set encoding=utf-8

syntax enable

if (has("termguicolors"))
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
" let g:dracula_colorterm = 0
" let g:dracula_italic = 1
" colorscheme dracula
let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

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

" set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:·
set list

" Show search count
set shortmess-=S

" map <C-J> :bnext<CR>
" map <C-K> :bprev<CR>
map <C-J> <C-W><C-J>
map <C-K> <C-W><C-K>
map <C-H> <C-W><C-H>
map <C-L> <C-W><C-L>

set splitbelow
set splitright

set clipboard=unnamed
" Copy file name
nmap yfn :let @*=expand('%:t')<CR>
" Copy file name with project path
nmap yfp :let @*=expand("%")<CR>
" Copy file name with full path
nmap yffp :let @*=expand("%:p")<CR>

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
vnoremap <leader>r y:%s/<C-R>"//g<left><left>

" Open file explorer
nmap <silent> <leader>e :Ex<CR>

" Allow uppercase commands
command W w
command Q q
command Bd bd
command Qa qa
command Wa wa
command Tabe tabe

" Open file in browser
nmap <silent> <leader>w :!open % -a Microsoft\ Edge<CR><CR>

" Replace currently selected text with default register without yanking it
vnoremap <leader>p "_dP

" Disable unsafe commands in project-specific .vimrc files
set secure
