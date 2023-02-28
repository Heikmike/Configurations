local keymap = vim.keymap.set
local opts = {noremap = true, silent = true}
local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
        color_devicons = true,

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-a>"] = actions.select_all,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next
            }
        }
    },
    pickers = {},
    extensions = {}
}

keymap('n', '<A-c>', ':Telescope commands<CR>', opts)
keymap('n', '<C-h>', ':Telescope command_history<CR>', opts)
keymap('n', '<C-p>', ':Telescope find_files<CR>', opts)
keymap('n', '<C-B>', ':Telescope buffers<CR>', opts)
