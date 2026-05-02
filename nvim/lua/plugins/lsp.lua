return {
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
        },

        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local opts = { noremap = true, silent = true, buffer = args.buf }
                    local map = vim.keymap.set

                    map('n', 'gd', vim.lsp.buf.definition, opts)
                    map('n', 'gD', vim.lsp.buf.declaration, opts)
                    map('n', 'gi', vim.lsp.buf.implementation, opts)
                    map('n', 'gr', vim.lsp.buf.references, opts)
                    map('n', 'K', vim.lsp.buf.hover, opts)
                    map('n', '<leader>rn', vim.lsp.buf.rename, opts)
                    map('n', '<leader>ca', vim.lsp.buf.code_action, opts)

                    if vim.lsp.inlay_hint then
                        vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
                    end
                end,
            })


            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
                float = {
                    border = 'rounded',
                    source = true,
                },
            })

            vim.keymap.set('n', 'go', vim.diagnostic.open_float, { silent = true })
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { silent = true })
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { silent = true })
            vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { silent = true })


            vim.lsp.config.buf_ls = {
                cmd = { 'buf', 'beta', 'lsp' },
                filetypes = { 'proto' },
                root_markers = { 'buf.yaml', 'buf.gen.yaml', '.git' },
                capabilities = capabilities,
            }
            vim.lsp.enable('buf_ls')

            vim.lsp.config.gopls = {
                cmd = { 'gopls', 'serve' },
                filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
                root_markers = { 'go.work', 'go.mod', '.git' },
                capabilities = capabilities,
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                            shadow = true,
                            nilness = true,
                            unusedwrite = true,
                            useany = true,
                        },
                        staticcheck = true,
                        gofumpt = true,
                        hints = {
                            assignVariableTypes = true,
                            compositeLiteralFields = true,
                            constantValues = true,
                            parameterNames = true,
                            rangeVariableTypes = true,
                        },
                    },
                },
            }
            vim.lsp.enable('gopls')

            vim.lsp.config.ts_ls = {
                cmd = { 'typescript-language-server', '--stdio' },
                filetypes = {
                    'typescript',
                    'typescriptreact',
                    'javascript',
                    'javascriptreact',
                },
                root_markers = { 'tsconfig.json', 'package.json', '.git' },
                capabilities = capabilities,
            }
            vim.lsp.enable('ts_ls')
        end,
    },
}
