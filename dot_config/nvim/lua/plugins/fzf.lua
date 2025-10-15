return {
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("fzf-lua").setup({
                fzf_opts = { ['--layout'] = 'default' },
            })
        end,
        keys = {
            { '<C-p>', function() require('fzf-lua').git_files() end, desc = 'Git Files' },
            { '<leader>f', function() require('fzf-lua').live_grep() end, desc = 'Live Grep' },
            { '<leader>b', function() require('fzf-lua').buffers() end, desc = 'Buffers' },
            { '<leader>/', function() require('fzf-lua').blines() end, desc = 'Buffer Lines' },
            { '<leader>l', function() require('fzf-lua').lines() end, desc = 'All Lines' },
            { '<leader>h', function() require('fzf-lua').help_tags() end, desc = 'Help Tags' },
            { '<leader>gc', function() require('fzf-lua').git_commits() end, desc = 'Git Commits' },
        },
    }
}
