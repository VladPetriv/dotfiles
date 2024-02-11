require("nvim-tree").setup {
  view = {
    width = 54,
    side = "right",
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
