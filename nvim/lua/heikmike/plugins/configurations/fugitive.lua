local keymap = vim.keymap.set

vim.api.nvim_create_user_command('MyGit', function ()
  vim.api.nvim_command('Git')
  vim.cmd.only()
  vim.api.nvim_command('normal 5j')
end, {
})

keymap("n", "<leader>gg", ":MyGit<CR>")
keymap("n", "<leader>gp", ":Git push<CR>")
keymap("n", "<leader>gl", ":Git la<CR> | :only<CR>")
keymap("n", "<leader>gs", ":Git status<CR>")
keymap("n", "<leader>gb", ":Git branch<CR>")
