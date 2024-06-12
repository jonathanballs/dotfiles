return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = {},
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            auto_install = true,
            ignore_install = {}
        })
    end
}
