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

-- Golang
map('n','<Leader>f',':GoTestFile<CR>',opts)
map('n','<Leader>r',':GoTestFunc<CR>',opts)
map('n','<Leader>a',':GoTest<CR>',opts)
map('n','<Leader>p',':GoTestPkg<CR>',opts)
map('n','<Leader>d',':GoDebug<CR>',opts)

--Zen mode
map('n','<Leader><Space>',':ZenMode<CR>',opts)

-- Tabs 
map('n', 'gT', '<Cmd>BufferPrevious<CR>', opts)
map('n', 'gt', '<Cmd>BufferNext<CR>', opts)
map('n', 'wn', '<Cmd>BufferClose<CR>', opts)

-- Trouble
map('n','<C-p>',':TroubleToggle<CR>',opts)
