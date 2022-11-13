local g = vim.g
local o = vim.opt
local cmd = vim.cmd
local exec = vim.api.nvim_exec

o.cursorline = true
o.clipboard = 'unnamedplus'
o.nu = true
o.hidden = true
o.errorbells = false
o.mouse = 'a'
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
o.wrap = false
o.hidden = true
o.swapfile = false
o.backup = false
o.undofile = true
o.incsearch = true
o.scrolloff = 8
o.signcolumn = 'yes'
o.cmdheight = 1
o.updatetime = 50
o.showmode = false
o.termguicolors = true
vim.g.mapleader = ";"

require('onedark').setup {
    style = 'deep'
}
require('onedark').load()
