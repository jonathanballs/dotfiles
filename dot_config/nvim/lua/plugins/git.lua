return {
    'ruanyl/vim-gh-line',
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",  -- required
            "sindrets/diffview.nvim", -- Diff integration
            "ibhagwan/fzf-lua",
        },
        config = true
    }
}
