local map = vim.keymap.set
local hi = vim.highlight.create
local opts = { noremap = true, silent = true }

vim.diagnostic.config({ signs = true })

map('n', 'go', vim.diagnostic.open_float, opts)
map('n', 'gT', vim.diagnostic.goto_prev, opts)
map('n', 'gt', vim.diagnostic.goto_next, opts)
map('n', '<Leader>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  map('n', 'gD', vim.lsp.buf.declaration, bufopts)
  map('n', 'gi', vim.lsp.buf.implementation, bufopts)
  map('n', '<Tab>', vim.lsp.buf.definition, bufopts)
  map('n', '<C-space>', vim.lsp.buf.hover, bufopts)
  map('n', 'gr', vim.lsp.buf.references, bufopts) 
end

return on_attach

