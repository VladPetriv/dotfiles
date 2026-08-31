return {
    {
        'mfussenegger/nvim-dap',
        lazy = true,
        ft = { 'go', 'gomod' },
        cmd = {
            'GoDebugPick',
            'DapGoAddProject',
            'DapGoReload',
            'DapStatus',
            'DapContinue',
            'DapNew',
            'DapToggleBreakpoint',
            'DapTerminate',
        },
        dependencies = {
            { 'rcarriga/nvim-dap-ui', dependencies = { 'nvim-neotest/nvim-nio' } },
        },
        config = function()
            require('config.dap')
        end,
    },
}
