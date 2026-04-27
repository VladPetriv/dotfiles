return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        keys = {
            { ",f", "<cmd>Telescope find_files<CR>", desc = "Find files" },
            { ",g", "<cmd>Telescope live_grep<CR>",  desc = "Live grep" },
            {
                "gs",
                function()
                    require("telescope").extensions.aerial.aerial()
                end,
                desc = "Search symbols (Aerial)",
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/aerial.nvim",
        },
        opts = function()
            local telescope = require("telescope")

            telescope.setup({
                defaults = {
                    layout_strategy = "horizontal",
                    sorting_strategy = "ascending",
                },
            })

            telescope.load_extension("aerial")
        end,
    },
}
