require("github-theme").setup({
	options = {
		transparent = true,
		styles = {
			comments = "italic",
			function_style = "italic",
		},
	},
})

vim.cmd("colorscheme github_dark")
