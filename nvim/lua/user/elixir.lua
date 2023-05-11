-- A callback that will get called when a buffer connects to the language server.
-- Here we create any key maps that we want to have on that buffer.
local on_attach = function(_, bufnr)
  local map_opts = { buffer = true, noremap = true}

  -- run the codelens under the cursor
  vim.keymap.set("n", "<space>r",  vim.lsp.codelens.run, map_opts)
  -- remove the pipe operator
  vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", map_opts)
  -- add the pipe operator
  vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", map_opts)
  vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", map_opts)

  -- standard lsp keybinds
  vim.keymap.set("n", "df", "<cmd>lua vim.lsp.buf.formatting_seq_sync()<cr>", map_opts)
  vim.keymap.set("n", "gd", "<cmd>lua vim.diagnostic.open_float()<cr>", map_opts)
  vim.keymap.set("n", "dt", "<cmd>lua vim.lsp.buf.definition()<cr>", map_opts)
  vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", map_opts)
  vim.keymap.set("n", "gD","<cmd>lua vim.lsp.buf.implementation()<cr>", map_opts)
  vim.keymap.set("n", "1gD","<cmd>lua vim.lsp.buf.type_definition()<cr>", map_opts)
  -- keybinds for fzf-lsp.nvim: https://github.com/gfanto/fzf-lsp.nvim
  -- you could also use telescope.nvim: https://github.com/nvim-telescope/telescope.nvim
  -- there are also core vim.lsp functions that put the same data in the loclist
  vim.keymap.set("n", "gr", ":References<cr>", map_opts)
  vim.keymap.set("n", "g0", ":DocumentSymbols<cr>", map_opts)
  vim.keymap.set("n", "gW", ":WorkspaceSymbols<cr>", map_opts)
  vim.keymap.set("n", "<leader>d", ":Diagnostics<cr>", map_opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("elixir").setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    elixirLS = {
      dialyzerEnabled = false,
      enableTestLenses = true,
      fetchDeps = false
    }
  }
})
