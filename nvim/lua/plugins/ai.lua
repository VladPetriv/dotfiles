return {
    {
        'boltlessengineer/zeta.nvim',
        event = 'InsertEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('zeta').setup({
                -- Check repo for available options
            })
        end,
    },
}
