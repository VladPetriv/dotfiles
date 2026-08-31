return {
    { 'rose-pine/neovim',            name = 'rose-pine', lazy = true },
    { 'projekt0n/github-nvim-theme', lazy = true },
    { 'bluz71/vim-nightfly-colors',  name = 'nigth',     lazy = true },
    { "ellisonleao/gruvbox.nvim", name = 'gruv', lazy = true },
    {
        'miikanissi/modus-themes.nvim',
        lazy = false,
        priority = 1000,
        config = function()
     --       vim.cmd('colorscheme modus')
        end,
    },
    {
       'nickkadutskyi/jb.nvim',
       lazy = false,
       priority = 1000,
       opts = {},
       config = function()
        -- require("jb").setup({transparent = true})
        vim.cmd("colorscheme jb")
       end,
    },
}
