require('telescope').setup {
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = '> ',
    color_devicons = true,

    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
  },
}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', ',f', '<cmd>Telescope find_files<CR>', opts)
map('n', ',g', '<cmd>Telescope live_grep<CR>', opts)
