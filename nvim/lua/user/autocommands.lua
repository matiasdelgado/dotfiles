vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup _netrw
    autocmd!
    autocmd FileType netrw noremap <buffer> <C-r> <cmd>e .<CR>
    autocmd FileType netrw noremap <buffer> <C-l> <C-w>l
  augroup end

  augroup _fzf
    autocmd!
    autocmd FileType fzf set norelativenumber
    autocmd FileType fzf set nonumber
    autocmd FileType fzf tnoremap <buffer> <esc> <C-c>
    " Navigate through files
    autocmd FileType fzf tnoremap <buffer> <C-j> <C-n>
    autocmd FileType fzf tnoremap <buffer> <C-k> <C-p>
    " Scroll preview
    autocmd FileType fzf tnoremap <buffer> <C-f> <S-down>
    autocmd FileType fzf tnoremap <buffer> <C-b> <S-up>
  augroup end
]]

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end
