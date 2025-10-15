vim.opt.termguicolors = true

return {
    { "sainnhe/everforest",               lazy = true },
    { "aktersnurra/no-clown-fiesta.nvim", lazy = true },
    { "rose-pine/neovim",                 name = "rose-pine", lazy = true },
    {
        'eddyekofo94/gruvbox-flat.nvim',
        priority = 1000,
        enabled = true,
        config = function()
            vim.cmd([[colorscheme gruvbox-flat]])
        end,
    }
}
