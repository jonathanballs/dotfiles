return {
    'ruanyl/vim-gh-line',
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }
}
