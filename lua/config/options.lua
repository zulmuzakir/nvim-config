-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Use Intelephense instead of Phpactor for PHP
vim.g.lazyvim_php_lsp = "intelephense"

-- Sync clipboard between system and Neovim
vim.opt.clipboard = "unnamedplus"
