local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<CR>", ":noh<CR><CR>:<backspace>", opts) -- Clear search highlight

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode
-- keymap("i", "jk", "<ESC>", opts)
-- keymap("i", "kj", "<ESC>", opts)

-- Commands --
-- https://superuser.com/a/1060644/1925249
-- Using keymap("c", "Q", "q", opts) will always replace the Q, even when searching
vim.api.nvim_create_user_command('Q','quit<bang>',{bang = true, bar = true})
vim.api.nvim_create_user_command('W','<line1>,<line2>write<bang> <args>',{bang = true, bar = true, nargs = "*", complete = "file", range = "%"})
vim.api.nvim_create_user_command('Bd','bdel<bang> <args>',{bang = true, bar = true, nargs = "*", complete = "buffer"})
vim.api.nvim_create_user_command('Tabe','tabe',{})
vim.api.nvim_create_user_command('Qa','qa<bang>',{bang = true})
vim.api.nvim_create_user_command('Wa','wa<bang>',{bang = true})

-- Visual --
-- Stay in indent mode
keymap("x", "<", "<gv", opts)
keymap("x", ">", ">gv", opts)

-- Move text up and down
keymap("x", "<A-j>", ":m .+1<CR>==", opts)
keymap("x", "<A-k>", ":m .-2<CR>==", opts)
keymap("x", "p", '"_dP', opts)

-- Find selection
keymap("x", "//", 'y/<C-R>"<CR>', opts)
keymap("x", "<leader>r", 'y:%s/<C-R>"//g<left><left>', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "C-j", ":move '>+1<CR>gv-gv", opts)
keymap("x", "C-k", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
