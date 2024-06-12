return {
    "elentok/format-on-save.nvim",
    config = function()
        local format_on_save = require("format-on-save")
        local formatters = require("format-on-save.formatters")
        format_on_save.setup({
            stderr_loglevel = vim.log.levels.OFF,
            exclude_path_patterns = {
                "/node_modules/",
                ".local/share/nvim/lazy",
            },
            formatter_by_ft = {
                css = formatters.lsp,
                elixir = formatters.lsp,
                html = formatters.prettierd,
                htmldjango = formatters.shell({
                    cmd = { "djhtml", "%" },
                    tempfile = function()
                        return vim.fn.expand("%") .. '.formatter-temp'
                    end,
                }),
                java = formatters.lsp,
                javascript = formatters.lsp,
                javascriptreact = formatters.lsp,
                json = formatters.lsp,
                lua = formatters.lsp,
                markdown = formatters.prettierd,
                openscad = formatters.lsp,
                php = formatters.lsp,
                python = formatters.black,
                rust = formatters.lsp,
                scad = formatters.lsp,
                scss = formatters.lsp,
                sh = formatters.shfmt,
                terraform = formatters.lsp,
                typescript = formatters.prettierd,
                typescriptreact = formatters.prettierd,
                yaml = formatters.lsp,
            },
        })
    end
}
