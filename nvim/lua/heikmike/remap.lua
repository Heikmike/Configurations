local keymap = vim.keymap.set

vim.g.mapleader = " "

-- Buffer things
-- keymap("n", "<leader>h", vim.cmd.Ex)
keymap("n", "<leader>al", vim.cmd.Alpha)
keymap("n", "<leader><leader>", ":bu#<CR>")
keymap("n", "<leader>+", ":horizontal resize +5<CR>")
keymap("n", "<leader>-", ":horizontal resize -5<CR>")
keymap("n", "<leader>on", ":only<CR>")
-- keymap("n", "<leader>tc", ":tabclose<CR>")
keymap("n", "<C-D>", "<C-F>")
keymap("n", "<leader>go", ":lua require('lualine').hide()<CR> | :Goyo<CR>")

-- Copy and paste
keymap("n", "<leader>y", 'Vyp')
keymap("v", "<leader>y", '"+y')

-- Move lines
keymap("n", "<A-j>", ":m .+1<CR>==")
keymap("n", "<A-k>", ":m .-2<CR>==")


-- Change in surroundings
keymap("n", "cib", "f{ci{")
keymap("n", "cis", "f[ci[")
keymap("n", "cig", 'f"ci"')
keymap("n", "cip", "f(ci(")
keymap("n", "ciq", "f'ci'")

-- Change keys
keymap("n", "U", '<C-R>')

-- Open configs
keymap("n", "<leader>nc", ":e ~/.config/nvim<CR> | :cd ~/.config/nvim<CR>")
