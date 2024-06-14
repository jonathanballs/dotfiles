-- Colorscheme
vim.g.mapleader = ";"

-- Load lazy and then plugin folders
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup('plugins')
-- require('languages')

vim.cmd [[colorscheme everforest]]
-- line to fix border background colour for floating box
vim.api.nvim_set_hl(0, 'FloatBorder', { link = 'Normal' })

-- enable line numbers
vim.wo.number = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Keyboard shortcuts
vim.api.nvim_set_keymap('i', 'jj', '<esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('s', 'jj', '<esc>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>f', ':Rg<CR>', { noremap = true, silent = true })

-- Rename symbol
vim.keymap.set('n', 'gR', vim.lsp.buf.rename, {})

-- Open error
vim.keymap.set('n', 'gE', vim.diagnostic.open_float, {})

-- Just set tabs to 2. Otherwise we should make editor configs...
vim.expandtab = true -- pressing TAB key inserts spaces
vim.tabstop = 2
vim.shiftwidth = 2
vim.softtabstop = 2

-- copy to system clipboard by prepending leader to yank commands
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+yg_')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>yy', '"+yy')
