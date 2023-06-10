-------------------------------------------------------------------------------
-- NVIM Module for terminal management.
-- @module terminal_manager
-- @author Yanis De Busschere <yanisdebusschere@gmail.com>
-- @license MIT
-------------------------------------------------------------------------------
local terminal_manager = require("heikmike.custom.terminal_manager.terminal_manager")

vim.keymap.set('n', '<leader>t', function()
    local char = vim.fn.getchar()
    terminal_manager.OpenTerm(vim.fn.nr2char(char), "")
end, {noremap = true, silent = true})

vim.keymap.set('t', '<C-x>', '<C-\\><C-n>', {silent = true})
vim.keymap.set('t', '<C-t>', '<C-\\><C-n><C-w>p', {silent = true})
