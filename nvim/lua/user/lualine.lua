local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diff = {
  "diff",
  colored = false,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width
}

local filetype = {
  "filetype",
  icons_enabled = false,
  icon = nil,
}

local location = {
  "location",
  padding = 0,
}

local filename = {
  "filename",
  file_status = true,      -- Displays file status (readonly status, modified status)
  newfile_status = false,  -- Display new file status (new file means no write after created)
  path = 1,                -- 0: Just the filename
  shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
  symbols = {
    modified = '[+]',      -- Text to show when the file is modified.
    readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
    unnamed = '[No Name]', -- Text to show for unnamed buffers.
    newfile = '[New]',     -- Text to show for new created file before first writting
  }
}

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "dracula",
    component_separators = { left = "", right = ""},
    section_separators = { left = "", right = ""},
    disabled_filetypes = { "dashboard", "Outline" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "diagnostics", diff },
    lualine_c = { filename },
    lualine_x = { filetype },
    lualine_y = { "encoding" },
    lualine_z = { "progress", location }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})
