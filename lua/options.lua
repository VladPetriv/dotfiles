local g = vim.g
local o = vim.opt
local cmd = vim.cmd
local exec = vim.api.nvim_exec

g.mapleader = ' '
o.cursorline = true
--o.termguicolors = true
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
--o.hlsearch = false
o.incsearch = true
o.scrolloff = 8
o.signcolumn = 'yes'
o.cmdheight = 1
o.updatetime = 50
o.showmode = false
vim.g.mapleader = ";"
--vim.o.background = 'light'

--[[
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = false,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  overrides = {},
})
cmd("colorscheme gruvbox")
]]--


--require('colorbuddy').colorscheme('cobalt2')
--
--vim.g.monokaipro_filter = "octogon"
--vim.g.monokaipro_italic_keywords = false

--cmd("colorscheme monokaipro")
local g = vim.g
local o = vim.opt
local cmd = vim.cmd
local exec = vim.api.nvim_exec

g.mapleader = ' '
o.cursorline = true
--o.termguicolors = true
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
--o.hlsearch = false
o.incsearch = true
o.scrolloff = 8
o.signcolumn = 'yes'
o.cmdheight = 1
o.updatetime = 50
o.showmode = false
vim.g.mapleader = ";"
--vim.o.background = 'light'

--[[
vim.o.background = 'light'
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = false,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  overrides = {},
})
cmd("colorscheme gruvbox")
]]--




--require('colorbuddy').colorscheme('cobalt2')
--
--vim.g.monokaipro_filter = "octogon"
--vim.g.monokaipro_italic_keywords = false

--cmd("colorscheme monokaipro")




local g = vim.g
local o = vim.opt
local cmd = vim.cmd
local exec = vim.api.nvim_exec

g.mapleader = ' '
o.cursorline = true
--o.termguicolors = true
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
--o.hlsearch = false
o.incsearch = true
o.scrolloff = 8
o.signcolumn = 'yes'
o.cmdheight = 1
o.updatetime = 50
o.showmode = false
vim.g.mapleader = ";"
--vim.o.background = 'light'

-- Gruvbox theme setup
--[[
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = false,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  overrides = {},
})
cmd("colorscheme gruvbox")
]]--

-- Set cobalt2 as theme
--require('colorbuddy').colorscheme('cobalt2')

-- Set up monokai pro theme
--vim.g.monokaipro_filter = "octogon"
--vim.g.monokaipro_italic_keywords = false

--cmd("colorscheme monokaipro")

cmd("colorscheme vscode")
