local kind_icons = {
    Text = "",
    Method = "m",
    Function = "󰊕",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = " ",
    Unit = "",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "",
    Event = "",
    Operator = "󰆕",
    TypeParameter = " ",
}

return {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            "rafamadriz/friendly-snippets",
            'VonHeikemen/lsp-zero.nvim',
        },
        config = function()
            local cmp = require('cmp')
            lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            local cmp_action = lsp_zero.cmp_action()
            local luasnip = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    -- `Enter` key to confirm completion
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        elseif cmp.visible() then
                            cmp.confirm({ select = true })
                        else
                            fallback()
                        end
                    end, { "i", "s" }),


                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    expandable_indicator = true,
                    format = function(entry, vim_item)
                        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                        return vim_item
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered()
                },
                experimental = {
                    ghost_text = true,
                    native_menu = false,
                },

            })

            vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
            vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help,
                { border = 'rounded' })
        end
    }
}

-- Ensure leaving luasnip session when
-- vim.api.nvim_create_autocmd('ModeChanged', {
--     pattern = '*',
--     callback = function()
--         if ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
--             and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
--             and not require('luasnip').session.jump_active
--         then
--             require('luasnip').unlink_current()
--         end
--     end
-- })
