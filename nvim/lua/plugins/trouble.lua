return {
    {
        'folke/trouble.nvim',
        cmd = { 'Trouble' },
        keys = {
            { '<C-p>', ':Trouble diagnostics toggle win.position=right win.size=0.4<CR>', desc = 'Toggle Trouble', silent = true },
        },
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            position = 'right',
            width = 80,
            mode = 'workspace_diagnostics',
        },
    },
}
