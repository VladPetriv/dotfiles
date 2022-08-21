local cmp = require('cmp')
local lspkind = require('lspkind')

local source_mapping = {
  buffer = '[Buffer]',
  nvim_lsp = '[LSP]',
  nvim_lua = '[Lua]',
  path = '[Path]',
}

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-u>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  formatting = {
    -- format = function(entry, vim_item)
    --   vim_item.kind = lspkind.presets.default[vim_item.kind]
    --   local menu = source_mapping[entry.source.name]
    --   if entry.source.name == 'cmp_tabnine' then
    --     if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
    --       menu = entry.completion_item.data.detail .. ' ' .. menu
    --     end
    --   vim_item.kind = ''
    --   end
    --   vim_item.menu = menu
    --   return vim_item
    -- end
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})
