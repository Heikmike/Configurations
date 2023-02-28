require('Comment').setup( {
		padding = true,
		sticky = true,
		ignore = '^$',
		toggler = {
			line = '<leader>cc',
			block = '<leader>cbb',
		},
		---LHS of operator-pending mappings in NORMAL and VISUAL mode
		opleader = {
			---Line-comment keymap
			line = '<leader>c',
			---Block-comment keymap
			block = '<leader>cb',
		},
		---LHS of extra mappings
		extra = {
			---Add comment on the line above
			above = '<leader>cO',
			---Add comment on the line below
			below = '<leader>co',
			---Add comment at the end of line
			eol = '<leader>cA',
		},
		---Enable keybindings
		mappings = {
			---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
			basic = true,
			---Extra mapping; `gco`, `gcO`, `gcA`
			extra = true,
		},
		---Function to call before (un)comment
		pre_hook = nil,
		---Function to call after (un)comment
		post_hook = nil,
	})
