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
Plugin 'SirVer/ultisnips.git'
Plugin 'leafgarland/typescript-vim'
Plugin 'janko-m/vim-test'
Plugin 'prettier/vim-prettier'
call vundle#end()
filetype plugin indent on

set encoding=utf-8

syntax enable
colorscheme gruvbox

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

" Snippets setup
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir="~/.vim/snippets"

" Tests setup
nmap <silent> <Leader>tn :TestNearest<CR>
nmap <silent> <Leader>tf :TestFile<CR>
nmap <silent> <Leader>tl :TestLast<CR>

" CtrlP setup
if !empty(glob("~/.vimrc_ctrlp"))
  source ~/.vimrc_ctrlp
endif
let g:ctrlp_custom_ignore = 'node_modules'

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

" Open file in browser
nmap <silent> <leader>w :!open % -a Google\ Chrome<CR><CR>

" Disable unsafe commands in project-specific .vimrc files
set secure
