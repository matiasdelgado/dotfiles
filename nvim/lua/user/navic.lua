local ok, navic = pcall(require, "nvim-navic")
if not ok then return end

local c = vim.fn.nr2char
local icons = {
  File          = c(0xe612) .. " ",
  Module        = c(0xe8a4) .. " ",
  Namespace     = c(0xe61b) .. " ",
  Package       = c(0xe612) .. " ",
  Class         = c(0xe770) .. " ",
  Method        = c(0xf794) .. " ",
  Property      = c(0xf0ad) .. " ",
  Field         = c(0xf0ad) .. " ",
  Constructor   = c(0xf794) .. " ",
  Enum          = c(0xe6b1) .. " ",
  Interface     = c(0xe6b0) .. " ",
  Function      = c(0xf794) .. " ",
  Variable      = c(0xe6a9) .. " ",
  Constant      = c(0xe77e) .. " ",
  String        = c(0xe612) .. " ",
  Number        = c(0xe6b2) .. " ",
  Boolean       = c(0xe6b2) .. " ",
  Array         = c(0xe6b3) .. " ",
  Object        = c(0xe6b4) .. " ",
  Key           = c(0xe80f) .. " ",
  Null          = c(0xe6b5) .. " ",
  EnumMember    = c(0xe6b1) .. " ",
  Struct        = c(0xe6b6) .. " ",
  Event         = c(0xe6b7) .. " ",
  Operator      = c(0xe6b8) .. " ",
  TypeParameter = c(0xe6b9) .. " ",
}

navic.setup({ highlight = true, icons = icons })

local navbuddy_ok, navbuddy = pcall(require, "nvim-navbuddy")
if navbuddy_ok then
  navbuddy.setup({ icons = icons })
end

local navic_filetypes = { elixir = true, eelixir = true, heex = true, cs = true }

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    if not navic_filetypes[ft] then return end
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.documentSymbolProvider and not navic.is_available(args.buf) then
      navic.attach(client, args.buf)
      if navbuddy_ok then navbuddy.attach(client, args.buf) end
    end
  end,
})

vim.o.winbar = "%{%v:lua.require('user.navic_fmt').get()%}"
