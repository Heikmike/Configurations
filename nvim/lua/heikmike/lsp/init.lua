-- LSP Configurations
require("heikmike.lsp.lua")
require("heikmike.lsp.python")
require("heikmike.lsp.typescript")
require("heikmike.lsp.angular")
require("heikmike.lsp.toml")
require("heikmike.lsp.terraform")
require("heikmike.lsp.docker")
require("heikmike.lsp.java")
require("heikmike.lsp.yaml")
require("heikmike.lsp.json")
require("heikmike.lsp.xml")
require("heikmike.lsp.tailwind")
require("heikmike.lsp.scala")
require("heikmike.lsp.cpp")


local vim = vim
local bind = vim.keymap.set
local telescope = require('telescope.builtin')

-- LSP Keymaps
bind('n', '<leader>fn', function() vim.lsp.buf.document_symbol() end)
bind('n', '<leader>fm', function() vim.lsp.buf.format() end)
bind('n', '<leader>rn', function() vim.lsp.buf.rename() end)
bind('n', 'K', function()
  vim.lsp.buf.hover({
    border = {
      { "╭", 'HoverBorder' },
      { "─", 'HoverBorder' },
      { "╮", 'HoverBorder' },
      { "│", 'HoverBorder' },
      { "╯", 'HoverBorder' },
      { "─", 'HoverBorder' },
      { "╰", 'HoverBorder' },
      { "│", 'HoverBorder' },
    }
  })
end)
bind('n', '<C-k>', function() vim.lsp.buf.signature_help() end)
bind('n', '<leader>sa', function() vim.lsp.buf.code_action() end)
bind('n', 'gd', function() vim.lsp.buf.definition() end)
bind('n', '<leader>sd', function() vim.diagnostic.open_float({ focusable = true }) end)
bind('n', '<leader>sk', function() vim.lsp.diagnostic.goto_prev() end)
bind('n', '<leader>sj', function() vim.lsp.diagnostic.goto_next() end)
bind('n', '<leader>ss', function() telescope.diagnostics() end)
