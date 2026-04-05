return {
    {
        'nvim-telescope/telescope.nvim',
        cmd = 'Telescope',
        keys = {
            { ',f', '<cmd>Telescope find_files<CR>', desc = 'Find files' },
            { ',g', '<cmd>Telescope live_grep<CR>',  desc = 'Live grep' },
        },
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {},
    },
}
