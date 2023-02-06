local builtin = require('telescope.builtin')
-- Search all files
vim.keymap.set('n', '<leader>sa', builtin.find_files, {})
-- Search all git files
vim.keymap.set('n', '<leader>sg', builtin.git_files, {})
-- Search all recent files
vim.keymap.set('n', '<leader>sr', builtin.oldfiles, {})
-- Search files in current directory
vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
