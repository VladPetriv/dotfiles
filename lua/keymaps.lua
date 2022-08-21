function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", ",<Space>", ":nohlsearch<CR>", { silent = true })
map("i", "jj", "<Esc>", { silent = true })
map("n", "<C-b>", ":NvimTreeToggle<CR>", { silent = true })
map("n", "<C-l>", ":GoLint<CR>", { silent = true })
map("n", "<C-q>", ":GoTest<CR>", { silent = true })
