return {
    -- Special configuration for developing neovim config
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({
                    buffer = bufnr,
                    preserve_mappings = false
                })
            end)
        end
    },

    -- Mason is a package manager that allows installing LSP servers
    -- automatically. mason-lspconfig.nvim provides :LspInstall
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup({})
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            require('mason-lspconfig').setup({
                ensure_installed = {
                    'ts_ls',      -- TypeScript/JavaScript
                    'elixirls',   -- Elixir
                    'lua_ls',     -- Lua (for Neovim config)
                },
                handlers = { lsp_zero.default_setup, },
            })
        end,
        dependencies = {
            'VonHeikemen/lsp-zero.nvim',
        }
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'VonHeikemen/lsp-zero.nvim',
        }
    }
}
