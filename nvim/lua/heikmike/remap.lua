local keymap = vim.keymap.set

vim.g.mapleader = " "

-- Buffer things
keymap("n", "<leader>al", vim.cmd.Alpha)
keymap("n", "<leader><leader>", ":bu#<CR>")
keymap("n", "<leader>+", ":horizontal resize +5<CR>")
keymap("n", "<leader>-", ":horizontal resize -5<CR>")
keymap("n", "<leader>on", ":only<CR>")
-- keymap("n", "<C-D>", "<C-F>")
keymap("n", "<leader>go", ":lua require('lualine').hide()<CR> | :Goyo<CR>")

-- Copy and paste
keymap("n", "<leader>y", 'Vyp')
keymap("v", "<leader>y", '"+y')

-- Change in surroundings
keymap("n", "cis", "f[ci[")
keymap("n", "cig", 'f"ci"')
keymap("n", "ciq", "f'ci'")

-- Change keys
keymap("n", "U", '<C-R>')

-- Open configs
keymap("n", "<leader>nc", ":e ~/.config/nvim<CR> | :cd ~/.config/nvim<CR>")
