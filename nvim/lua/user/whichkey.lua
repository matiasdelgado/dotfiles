local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = false, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  -- key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  -- },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  keys = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  win = {
    no_overlap = true,
    border = "rounded", -- none, single, double, shadow
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  filter = function(mapping)
    -- example to exclude mappings without a description
    -- return mapping.desc and mapping.desc ~= ""
    return true
  end,
  -- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers = {
    { "<auto>", mode = "nxso" }, -- automatically setup triggers
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    { "i", { "j", "k" } },
    { "v", { "j", "k" } }
  }
}

local mappings = {
  { "<leader>F", "<cmd>Files<cr>", desc = "Find files", nowait = true, remap = false },
  { "<leader>b", "<cmd>Buffers<cr>", desc = "Buffers", nowait = true, remap = false },
  { "<leader>d", group = "Code / LSP", nowait = true, remap = false },
  { "<leader>da", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", nowait = true, remap = false },
  { "<leader>dd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Go to definition", nowait = true, remap = false },
  { "<leader>df", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", desc = "Format", nowait = true, remap = false },
  { "<leader>dh", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover", nowait = true, remap = false },
  { "<leader>di", "<cmd>LspInfo<cr>", desc = "Info", nowait = true, remap = false },
  { "<leader>dj", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next Diagnostic", nowait = true, remap = false },
  { "<leader>dk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic", nowait = true, remap = false },
  { "<leader>dl", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action", nowait = true, remap = false },
  { "<leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Open float", nowait = true, remap = false },
  { "<leader>dq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix", nowait = true, remap = false },
  { "<leader>dr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename", nowait = true, remap = false },
  { "<leader>ds", "<C-w>]", desc = "Go to definition - horizontal split", nowait = true, remap = false },
  { "<leader>dv", "<C-w>] <C-w>L", desc = "Go to definition - vertical split", nowait = true, remap = false },
  { "<leader>e", "<cmd>Ex<cr>", desc = "Explorer", nowait = true, remap = false },
  { "<leader>f", "<cmd>GFiles<cr>", desc = "Find git files", nowait = true, remap = false },
  { "<leader>g", group = "Git", nowait = true, remap = false },
  { "<leader>gs", "<cmd>GitBlameCurrent<cr>", desc = "Blame current line", nowait = true, remap = false },
  { "<leader>o", group = "Open in browser", nowait = true, remap = false },
  { "<leader>ob", "<cmd>:!open % -a \"Microsoft Edge\"<cr>", desc = "Open File", nowait = true, remap = false },
  { "<leader>op", "<cmd>ViewPr<cr>", desc = "Pull Request", nowait = true, remap = false },
  { "<leader>p", group = "Packer", nowait = true, remap = false },
  { "<leader>pS", "<cmd>PackerStatus<cr>", desc = "Status", nowait = true, remap = false },
  { "<leader>pc", "<cmd>PackerCompile<cr>", desc = "Compile", nowait = true, remap = false },
  { "<leader>pi", "<cmd>PackerInstall<cr>", desc = "Install", nowait = true, remap = false },
  { "<leader>ps", "<cmd>PackerSync<cr>", desc = "Sync", nowait = true, remap = false },
  { "<leader>pu", "<cmd>PackerUpdate<cr>", desc = "Update", nowait = true, remap = false },
  { "<leader>r", group = "Terminal", nowait = true, remap = false },
  { "<leader>rf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float", nowait = true, remap = false },
  { "<leader>rh", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal", nowait = true, remap = false },
  { "<leader>rn", "<cmd>lua _NODE_TOGGLE()<cr>", desc = "Node", nowait = true, remap = false },
  { "<leader>rv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical", nowait = true, remap = false },
  { "<leader>s", "<cmd>lua require'user.switch_case'.switch_case()<CR>", desc = "Switch case (snake_case <-> camelCase)", nowait = true, remap = false },
  { "<leader>t", group = "Tests" }, -- , nowait = true, remap = false 
  { "<leader>tf", "<cmd>TestFile<CR>", desc = "File", nowait = true, remap = false },
  { "<leader>tl", "<cmd>TestLast<CR>", desc = "Last", nowait = true, remap = false },
  { "<leader>tn", "<cmd>TestNearest<CR>", desc = "Nearest", nowait = true, remap = false },
  { "<leader>x", "<cmd>Find<cr>", desc = "Find Text", nowait = true, remap = false },
  { "<leader>y", group = "Yank", nowait = true, remap = false },
  { "<leader>ya", "<cmd>:let @+ = expand('%:p')<cr>", desc = "Absolute file path", nowait = true, remap = false },
  { "<leader>yn", "<cmd>:let @+ = expand('%:t')<cr>", desc = "File name", nowait = true, remap = false },
  { "<leader>yr", "<cmd>:let @+ = expand('%')<cr>", desc = "Relative file path", nowait = true, remap = false }
}

which_key.setup(setup)
which_key.add(mappings)
