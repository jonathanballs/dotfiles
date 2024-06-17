return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "jfpedroza/neotest-elixir"
    },
    config = function()
        local neotest = require('neotest')

        neotest.setup({
            adapters = {
                require('neotest-elixir')
            },
            output_panel = {
                open = 'botright vsplit | vertical resize 80'
            }
        })
    end,
    keys = {
        {
            "tt",
            function()
                require("neotest").run.run()
            end
        },
        {
            "twt",
            function()
                require("neotest").watch.watch()
            end
        },
        {
            "tf",
            function()
                require("neotest").run.run(vim.fn.expand("%"))
            end
        },
        {
            "twf",
            function()
                require("neotest").watch.watch(vim.fn.expand("%"))
            end
        },
        {
            "tp",
            function()
                require("neotest").run.run({ suite = true })
            end
        },
        {
            "twp",
            function()
                require("neotest").watch.watch({ suite = true })
            end
        },
        {
            "ts",
            function()
                require("neotest").summary.toggle()
            end
        },
        {
            "tE",
            function()
                require("neotest").output.open({ enter = true })
            end
        },
        {
            "to",
            function()
                require("neotest").output_panel.open()
            end
        }
    }
}
