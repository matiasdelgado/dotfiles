let g:ale_elixir_elixir_ls_release = expand("~/work/elixir-ls/release")
let g:ale_elixir_elixir_ls_config = {'elixirLS': {'dialyzerEnabled': v:false}}

set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1

let g:ale_linters = {}
let g:ale_linters.scss = ['stylelint']
let g:ale_linters.css = ['stylelint']
let g:ale_linters.elixir = ['elixir-ls', 'credo']

let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fixers.javascript = ['eslint', 'prettier']
let g:ale_fixers.html = ['prettier']
let g:ale_fixers.cls = ['prettier']
let g:ale_fixers.scss = ['stylelint']
let g:ale_fixers.css = ['stylelint']
let g:ale_fixers.elixir = ['mix_format']
" let g:ale_fixers.xml = ['xmllint']

let g:ale_sign_column_always = 1
let g:ale_elixir_credo_strict = 1
" let g:ale_fix_on_save = 1

nnoremap gD :ALEGoToDefinition<cr>
nnoremap gDS :ALEGoToDefinition -split<cr>
nnoremap gDV :ALEGoToDefinition -vsplit<cr>
nnoremap gR :ALEFindReferences<cr>
" nnoremap df :ALEFix<cr>
nnoremap K :ALEHover<cr>
