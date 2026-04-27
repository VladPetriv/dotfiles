return {
    { 'rose-pine/neovim',            name = 'rose-pine', lazy = true },
    { 'projekt0n/github-nvim-theme', lazy = true },
    { 'bluz71/vim-nightfly-colors', name = 'nigth', lazy = true },
    {
        'miikanissi/modus-themes.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd('colorscheme modus')
        end,
    },
    { "ellisonleao/gruvbox.nvim", name = 'gruv', lazy = true }
}
