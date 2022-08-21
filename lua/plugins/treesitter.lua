require('nvim-treesitter.configs').setup {
  ensure_installed = { "go", "gomod", "dockerfile", "make", "json", "html", "css", "markdown", "lua" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
  }
}
