return {
    {
        'ray-x/go.nvim',
        ft = { 'go', 'gomod' },
        dependencies = {
            'ray-x/guihua.lua',
            'nvim-treesitter/nvim-treesitter',
        },
        build = ':lua require("go.install").update_all_sync()',
        opts = {
            run_in_floaterm = true,
            dap_debug_gui = false,
            dap_debug_keymap = false,
            dap_debug_vt = false,
        },
    },
}
