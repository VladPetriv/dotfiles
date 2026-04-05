return {
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        cmd = 'Neotree',
        keys = {
            { '<C-b>', ':Neotree toggle<CR>', desc = 'Toggle Neotree', silent = true },
        },
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
        opts = {
            close_if_last_window = false,
            popup_border_style = 'rounded',
            enable_git_status = true,
            enable_diagnostics = true,
            window = {
                position = 'right',
                width = 40,
            },
            filesystem = {
                filtered_items = {
                    hide_dotfiles = true,
                    hide_gitignored = true,
                },
                follow_current_file = { enabled = false },
            },
        },
    },
}
