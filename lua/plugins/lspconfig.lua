local lspconfig = require('lspconfig')
local util = require('lspconfig/util')
local configs = require 'lspconfig/configs'

local function config(_config)
  return vim.tbl_deep_extend('force', {
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  }, _config or {})
end

lspconfig.gopls.setup(config({
  on_attach = require('plugins.lsp'),
  cmd = { 'gopls', 'serve' },
  filetypes = { 'go', 'go.mod' },
  root_dir = util.root_pattern('go.work', 'go.mod', '.git'),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    }
  }
}))

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " } 
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end


if not configs.golangcilsp then
 	configs.golangcilsp = {
		default_config = {
			cmd = {'golangci-lint-langserver'},
			root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
			init_options = {
					command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json", "--issues-exit-code=1" };
			}
		};
	}
end
lspconfig.golangci_lint_ls.setup {
	filetypes = {'go','gomod'}
}
