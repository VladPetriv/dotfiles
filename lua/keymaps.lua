function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('i', 'jj', '<Esc>', { silent = true })
map('n', ',<Space>', ':nohlsearch<CR>', { silent = true })
map('n', '<C-b>', ':NvimTreeToggle<CR>', { silent = true })
map('n', '<C-q>', ':GoTest<CR>', { silent = true })
map('n', '<C-Space>', ':ZenMode<CR>', { silent = true })
map('n', '<C-g>', ':Neogit<CR>', { silent = true })
map('n', 'gT', '<Cmd>BufferPrevious<CR>', opts)
map('n', 'gt', '<Cmd>BufferNext<CR>', opts)
map('n', 'wn', '<Cmd>BufferClose<CR>', opts)
