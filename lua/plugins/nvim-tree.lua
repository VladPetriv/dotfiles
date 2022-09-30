require("nvim-tree").setup {
  view = {
    width = 54,
    mappings = {
      list = {
        { key = "s", action = "vsplit" },
      },
    },
  },
  git = {
    ignore = false,
  },
}
