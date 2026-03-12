local mason_ok, mason = pcall(require, "mason")
if not mason_ok then return end

local mlsp_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mlsp_ok then return end

local util = require("lspconfig.util")

local servers = {
  "ts_ls",
}

local ensure_installed = vim.deepcopy(servers)

-- Mason setup ---------------------------------------------------------
local settings = {
  registries = {
    "github:mason-org/mason-registry",
    "github:Crashdummyy/mason-registry",
  },
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
  ensure_installed = ensure_installed,
  automatic_installation = false,
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

