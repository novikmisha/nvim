vim.loader.enable()

vim.opt.background = "dark"
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes:2'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 5

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"

vim.g.mapleader = " "

vim.opt.wildmode = "longest,full"

local function escape(str)
    local escape_chars = [[;,."|\]]
    return vim.fn.escape(str, escape_chars)
end

local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]
vim.opt.langmap = vim.fn.join({
    escape(ru_shift) .. ";" .. escape(en_shift),
    escape(ru) .. ";" .. escape(en),
}, ",")
