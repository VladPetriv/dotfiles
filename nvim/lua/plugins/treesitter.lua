return {
    {
        'nvim-treesitter/nvim-treesitter',
        event = { 'BufReadPost', 'BufNewFile' },
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter').setup({
                ensure_installed = {
                    'go', 'gomod', 'gowork', 'gosum',
                    'lua', 'typescript', 'javascript',
                    'markdown', 'markdown_inline',
                    'json', 'sql', 'comment', 'proto',
                    'html', 'yaml'
                },
                auto_install = true,
            })

            -- Enable treesitter highlighting for all buffers
            vim.api.nvim_create_autocmd('FileType', {
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })
        end,
    },
}
