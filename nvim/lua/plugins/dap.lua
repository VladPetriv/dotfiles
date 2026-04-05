return {
    {
        'mfussenegger/nvim-dap',
        lazy = true,
        dependencies = {
            { 'rcarriga/nvim-dap-ui', dependencies = { 'nvim-neotest/nvim-nio' } },
        },
    },
}
