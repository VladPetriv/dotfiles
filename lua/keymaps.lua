function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--Normal mode
map('i', 'jj', '<Esc>', { silent = true })
map('n', ',<Space>', ':nohlsearch<CR>', { silent = true })

--File manager
map('n', '<C-b>', ':NvimTreeToggle<CR>', { silent = true })

--Git
map('n', '<C-g>', ':DiffviewOpen<CR>', { silent = true })
map('n', '<C-k>', ':DiffviewClose<CR>', { silent = true })
map('n', '<Leader>g',':ToggleBlameLine<CR>', { silent = true })

-- Trouble
map('n', '<C-p>', ':TroubleToggle<CR>', opts)

-- Golang
map('n','<Leader>f',':GoTestFile<CR>',opts)
map('n','<Leader>r',':GoTestFunc<CR>',opts)
map('n','<Leader>a',':GoTest<CR>',opts)
map('n','<Leader>p',':GoTestPkg<CR>',opts)
map('n','<Leader>d',':GoDebug<CR>',opts)
