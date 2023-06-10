local keymap = vim.keymap.set

vim.g.mapleader = " "

-- Buffer things
keymap("n", "<leader>h", vim.cmd.Ex)
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

-- Change in surroundings
keymap("n", "cb", "ci{")
keymap("n", "csb", "ci[")
keymap("n", "cg", 'ci"')
keymap("n", "cp", "ci(")
keymap("n", "cq", "ci'")

-- Change keys
keymap("n", ",", "/")
keymap("n", "U", '<C-R>')

-- Git
keymap("n", "<leader>gg", ":Git<CR> | :only<CR>")
keymap("n", "<leader>ga", ":Git add %<CR> | :Git commit<CR>")
keymap("n", "<leader>gc", ":Git commit<CR> | :only<CR>")
keymap("n", "<leader>gp", ":Git push<CR>")
keymap("n", "<leader>gf ", ":Git pull<CR>")
keymap("n", "<leader>gl", ":Git la<CR> | :only<CR>")
keymap("n", "<leader>gd", ":DiffviewOpen<CR>")
-- keymap("n", "<leader>tt", ":DiffviewToggleFiles<CR>")
keymap("n", "<leader>gs", ":Git status<CR>")
keymap("n", "<leader>gb", ":Git branch<CR>")

-- Open configs
keymap("n", "<leader>nc", ":e ~/.config/nvim<CR> | :cd ~/.config/nvim<CR>")
