return {
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        opts = {},
    },
    {
        'numToStr/Comment.nvim',
        event = { 'BufReadPost', 'BufNewFile' },
        opts = {},
    },
    {
        'folke/todo-comments.nvim',
        event = { 'BufReadPost', 'BufNewFile' },
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {},
    },
    { 'sbdchd/neoformat',             cmd = 'Neoformat' },
    { 'iamcco/markdown-preview.nvim', ft = 'markdown',  build = ':call mkdp#util#install()' },
}
