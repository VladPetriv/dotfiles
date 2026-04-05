return {
    {
        'folke/trouble.nvim',
        cmd = { 'TroubleToggle', 'Trouble' },
        keys = {
            { '<C-p>', ':TroubleToggle<CR>', desc = 'Toggle Trouble', silent = true },
        },
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            position = 'right',
            width = 80,
            mode = 'workspace_diagnostics',
        },
    },
}
