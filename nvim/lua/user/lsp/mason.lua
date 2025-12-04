local mason_ok, mason = pcall(require, "mason")
if not mason_ok then return end

local mlsp_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mlsp_ok then return end

local util = require("lspconfig.util")

local servers = {
  "ts_ls",
}

-- Mason setup ---------------------------------------------------------
local settings = {
  ui = {
    border = "none",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

require("mason").setup(settings)

require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = false,
  automatic_enable = {
    exclude = { "omnisharp" },
  },
})

-- require("mason-tool-installer").setup({
--   ensure_installed = {
--     "prettier",
--   },
-- })

-- Register servers using the new vim.lsp.config API ------------------
for _, server in ipairs(servers) do
  local base = vim.lsp.config[server] or {}

  -- Load optional server-specific settings
  local ok, custom = pcall(require, "user.lsp.settings." .. server)
  if not ok then custom = {} end

  local opts = vim.tbl_deep_extend("force", base, custom, {
    capabilities = require("user.lsp.handlers").capabilities,
    -- root_dir = util.find_git_ancestor,
    root_dir = util.root_pattern(".git")
    -- do NOT put on_attach here (we use LspAttach instead)
  })

  vim.lsp.config[server] = opts
end

-- Enable all servers now that configs are registered
vim.lsp.enable(servers)

-- OmniSharp (legacy API still needed until they migrate) ------------
-- local lspconfig = require("lspconfig") -- still needed ONLY for OmniSharp right now
-- local omnisharp_opts = require("user.lsp.settings.omnisharp")
-- 
-- omnisharp_opts.on_attach = require("user.lsp.handlers").on_attach
-- omnisharp_opts.capabilities = require("user.lsp.handlers").capabilities
-- 
-- lspconfig.omnisharp.setup(omnisharp_opts)
local omnisharp_opts = require("user.lsp.settings.omnisharp")
local handlers = require("user.lsp.handlers")

vim.lsp.config.omnisharp = vim.tbl_deep_extend("force",
  vim.lsp.config.omnisharp or {},
  {
    capabilities = handlers.capabilities,
    on_attach = handlers.on_attach,
    root_dir = function(fname)
      return require("lspconfig.util").find_git_ancestor(fname)
    end,
  },
  omnisharp_opts
)

vim.lsp.enable({ "omnisharp" })
