local api = vim.api
local g = vim.g
local opt = vim.opt

-- remap leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

vim.scriptencoding = "utf-8"
vim.wo.number = true
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.backup = false
opt.shell = "zsh"
opt.ignorecase = true -- case insensitive searching UNLESS /C or capital in search
opt.smarttab = true
opt.smartcase = true
opt.breakindent = true
opt.hlsearch = true
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.undofile = true
opt.signcolumn = "yes"        -- always show sign column
opt.clipboard = "unnamedplus" -- access syustem clipboard
opt.timeoutlen = 300          -- time in milliseconds to wait for a mapped sequence to complete
opt.wrap = false

-- better secape using jk in insert and terminal mode
local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- better escape using jk in insert and terminal mode
keymap("i", "jk", "<ESC>", default_opts)
keymap("t", "jk", "<C-\\><C-n>", default_opts)

-- paset over currently selected text without yanking it
keymap("v", "p", '"_dP', default_opts)

-- increment / decrement
keymap("n", "+", "<C-a>", default_opts)
keymap("n", "-", "<C-x>", default_opts)

-- split window
keymap("n", "ss", ":split<Return><C-w>w", default_opts)
keymap("n", "sv", ":vsplit<Return><C-w>w", default_opts)

-- Resize window
keymap("", "sh", "<C-w>h", default_opts)
keymap("", "sk", "<C-w>k", default_opts)
keymap("", "sj", "<C-w>j", default_opts)
keymap("", "sl", "<C-w>l", default_opts)

keymap("n", "<C-w><left>", "<C-w><", default_opts)
keymap("n", "<C-w><right>", "<C-w>>", default_opts)
keymap("n", "<C-w><up>", "<C-w>+", default_opts)
keymap("n", "<C-w><down>", "<C-w>-", default_opts)
