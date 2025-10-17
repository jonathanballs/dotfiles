return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            -- Use prettierd (faster) or prettier for web languages
            astro = { "prettierd", "prettier", stop_after_first = true },
            html = { "prettierd", "prettier", stop_after_first = true },
            markdown = { "prettierd", "prettier", stop_after_first = true },
            css = { "prettierd", "prettier", stop_after_first = true },
            scss = { "prettierd", "prettier", stop_after_first = true },
            javascript = { "prettierd", "prettier", stop_after_first = true },
            javascriptreact = { "prettierd", "prettier", stop_after_first = true },
            typescript = { "prettierd", "prettier", stop_after_first = true },
            typescriptreact = { "prettierd", "prettier", stop_after_first = true },
            json = { "prettierd", "prettier", stop_after_first = true },

            -- Python
            python = { "black" },

            -- Shell
            sh = { "shfmt" },

            -- Django templates
            htmldjango = { "djhtml" },
        },
        format_on_save = function(bufnr)
            -- Disable formatting on certain paths
            local bufname = vim.api.nvim_buf_get_name(bufnr)
            if bufname:match("/node_modules/")
                or bufname:match(".local/share/nvim/lazy")
                or bufname:match("/code/horizon/")
                or bufname:match("/code/sunrise/")
                or bufname:match("/code/aurora/") then
                return
            end

            return {
                timeout_ms = 500,
                lsp_fallback = true,
            }
        end,
        formatters = {
            djhtml = {
                command = "djhtml",
                args = { "-" },
                stdin = true,
            },
        },
    },
}
