local servers = {
  -- Add any servers you want to ensure are installed
}

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
  -- Exclude omnisharp from automatic enabling to prevent conflicts
  automatic_enable = {
    exclude = { "omnisharp" }
  },
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

-- Manual setup for other servers in the list (if any)
for _, server in pairs(servers) do
  local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
    root_dir = lspconfig.util.find_git_ancestor
  }

  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end

-- Manual OmniSharp setup with your custom configuration
local omnisharp_opts = require("user.lsp.settings.omnisharp")
omnisharp_opts.on_attach = require("user.lsp.handlers").on_attach
omnisharp_opts.capabilities = require("user.lsp.handlers").capabilities
lspconfig.omnisharp.setup(omnisharp_opts)
