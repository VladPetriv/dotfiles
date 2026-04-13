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
                    map('n', 'gD', vim.lsp.buf.declaration, opts)
                    map('n', 'gi', vim.lsp.buf.implementation, opts)
                    map('n', 'gd', vim.lsp.buf.definition, opts)
                    map('n', '<Leader><Space>', vim.lsp.buf.hover, opts)
                    map('n', 'gr', vim.lsp.buf.references, opts)
                end,
            })

            vim.diagnostic.config({ signs = true })
            local gopts = { noremap = true, silent = true }
            vim.keymap.set('n', 'go', vim.diagnostic.open_float, gopts)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, gopts)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, gopts)
            vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist, gopts)

            -- protobuf (buf)
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
                        semanticTokens = true,
                        analyses = {
                            unusedparams = true,
                            shadow = true,
                            nilness = true,
                            unusedwrite = true,
                            useany = true,
                        },
                        staticcheck = true,
                        gofumpt = true,
                        -- hints = {
                        --     assignVariableTypes = true,
                        --     compositeLiteralFields = true,
                        --     compositeLiteralTypes = true,
                        --     constantValues = true,
                        --     functionTypeParameters = true,
                        --     parameterNames = true,
                        --     rangeVariableTypes = true,
                        -- },
                    },
                },
            }
            vim.lsp.enable('gopls')

            vim.lsp.config.ts_ls = {
                cmd = { 'typescript-language-server', '--stdio' },
                filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
                root_markers = { 'tsconfig.json', 'package.json', '.git' },
                capabilities = capabilities,
            }
            vim.lsp.enable('ts_ls')

            local signs = { Error = " ", Warn = " ", Hint = " ", Info = "" }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end
            vim.keymap.set("n", "<leader>wd", function()
                vim.lsp.buf.workspace_diagnostics()
            end, { desc = "Workspace diagnostics" })
        end,
    },
}
