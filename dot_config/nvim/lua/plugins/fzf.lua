vim.api.nvim_set_keymap('n', '<C-p>', ':GFiles<CR>', { noremap = true, silent = true })

return {
    {
        "junegunn/fzf",
        build = "./install --bin"
    },
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- calling `setup` is optional for customization
            require("fzf-lua").setup({
                fzf_opts = { ['--layout'] = 'reverse-list' },
            })
        end
    },
    {
        'junegunn/fzf.vim',
    }
}
