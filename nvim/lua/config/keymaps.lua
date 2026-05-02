local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

local function toggle_inlay_hints()
    if not vim.lsp.inlay_hint then
        return
    end

    local enabled = vim.lsp.inlay_hint.is_enabled and vim.lsp.inlay_hint.is_enabled()
    vim.lsp.inlay_hint.enable(not enabled)
end

map('i', 'jj', '<Esc>', { silent = true })
map('n', ',<Space>', ':nohlsearch<CR>', { silent = true })

-- Git
map('n', '<C-g>', ':DiffviewOpen<CR>', { silent = true })
map('n', '<C-k>', ':DiffviewClose<CR>', { silent = true })
-- File history (MOST IMPORTANT)
map('n', '<Leader>gh', ':DiffviewFileHistory %<CR>', { silent = true })
-- Repo history
map('n', '<Leader>gH', ':DiffviewFileHistory<CR>', { silent = true })
map('n', '<Leader>g', ':Gitsigns toggle_current_line_blame<CR>', { silent = true })
map('n', "<C-'>", ':Gitsigns preview_hunk<CR>', { silent = true })
map('n', "<C-;>", ':Gitsigns reset_hunk<CR>', { silent = true })

-- Golang
map('n', '<Leader>f', ':GoTestFile<CR>')
map('n', '<Leader>r', ':GoTestFunc<CR>')
map('n', '<Leader>a', ':GoTest<CR>')
map('n', '<Leader>p', ':GoTestPkg<CR>')
map('n', '<Leader>d', ':GoDebug<CR>')
map('n', '<Leader>fs', ':GoFillStruct<CR>')

-- Tabs
map('n', 'gT', '<Cmd>BufferPrevious<CR>')
map('n', 'gt', '<Cmd>BufferNext<CR>')
map('n', 'wn', '<Cmd>BufferClose<CR>')

-- NodeJS
map('n', '<Leader>s', ':Neoformat<CR>')

-- Toggle light/dark mode
map('n', '<Leader>td', function()
    if vim.o.background == "dark" then
        vim.o.background = "light"
    else
        vim.o.background = "dark"
    end
end, { silent = true, desc = "Toggle light/dark mode" })

map('n', '<leader>th', toggle_inlay_hints, {
    silent = true,
    desc = "Toggle LSP inlay hints"
})
