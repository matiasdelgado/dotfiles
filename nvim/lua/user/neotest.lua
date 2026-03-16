-- Ensure neotest-dotnet uses the Microsoft dotnet (has v8 SDK) instead of Homebrew's (v10 only)
vim.env.PATH = "/usr/local/share/dotnet:" .. vim.env.PATH

require("neotest").setup({
  icons = {
    passed        = vim.fn.nr2char(0xf00c),
    failed        = vim.fn.nr2char(0xf00d),
    skipped       = vim.fn.nr2char(0xf04d),
    unknown       = "○",
    running       = vim.fn.nr2char(0xf110),
    collapsed     = "▸",
    expanded      = "▾",
    child_prefix  = "├",
    child_indent  = "│",
    final_child_prefix = "╰",
    non_collapsible = " ",
    test          = vim.fn.nr2char(0xf0c3),
    watching      = vim.fn.nr2char(0xf06e),
  },
  adapters = {
    require("neotest-dotnet")({
      dotnet_additional_args = {
        "--verbosity", "minimal",
      },
      discovery_root = "solution", -- important for backend/*.sln
    }),
  },
})
