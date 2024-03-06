local palette = require("github-theme.palette.github_dark").palette
local lualine_theme = require("lualine.themes.github_dark_default")

local function darken(color, value)
	local r = tonumber(string.sub(color, 2, 3), 16)
	local g = tonumber(string.sub(color, 4, 5), 16)
	local b = tonumber(string.sub(color, 6, 7), 16)
	r = math.floor(r * (1 - value))
	g = math.floor(g * (1 - value))
	b = math.floor(b * (1 - value))
	return string.format("#%02x%02x%02x", r, g, b)
end

local function lighten(color, value)
	local r = tonumber(string.sub(color, 2, 3), 16)
	local g = tonumber(string.sub(color, 4, 5), 16)
	local b = tonumber(string.sub(color, 6, 7), 16)
	r = math.floor(r * (1 + value))
	g = math.floor(g * (1 + value))
	b = math.floor(b * (1 + value))
	return string.format("#%02x%02x%02x", r, g, b)
end

local function tint_lualine_group(color)
	local group = {
		a = { bg = color, fg = palette.canvas.default },
		b = {
			bg = darken(color, 0.3),
			fg = lighten(color, 0.3),
		},
		c = {
			bg = "NONE",
			fg = palette.fg.default,
		},
	}
	return group
end

lualine_theme.normal = tint_lualine_group(palette.red.base)
lualine_theme.insert = tint_lualine_group(palette.green.base)
lualine_theme.command = tint_lualine_group(palette.magenta.base)
lualine_theme.visual = tint_lualine_group(palette.blue.base)
lualine_theme.terminal = tint_lualine_group(palette.orange)
lualine_theme.replace = tint_lualine_group(palette.yellow.base)
lualine_theme.inactive.a = { bg = darken(palette.red.base, 0.6), fg = palette.canvas.default }
lualine_theme.inactive.c = { bg = "NONE" }

local coc_extension = {
	sections = {
		lualine_a = { { "filename", separator = { left = "", right = "" } } },
	},
	filetypes = {
		"neo-tree",
		"coc-explorer",
		"dapui_breakpoints",
		"dapui_scopes",
		"dapui_stacks",
		"dapui_watches",
		"dap-repl",
		"dapui_console",
	},
}

local use_parent_list = { "src", "test", "done" }
local function directory()
	local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
	if vim.tbl_contains(use_parent_list, cwd) then
		cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":h:t")
	end
	return cwd
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = lualine_theme,
		section_separators = { left = "", right = "" },
		component_separators = { left = "|", right = "|" },
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { { directory, separator = { left = "", right = "" } } },
		lualine_b = {
			"filename",
			"diff",
			{ "diagnostics", sources = { "nvim_diagnostic", "coc" } },
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = { "encoding", "fileformat", "filetype" },
		lualine_z = { { "location", separator = { left = "", right = "" } } },
	},
	inactive_sections = {
		lualine_a = { { "filename", separator = { left = "", right = "" } } },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { { "location", separator = { left = "", right = "" } } },
	},
	tabline = {},
	extensions = { coc_extension },
})


require("transparent").setup({ extra_groups = {}, exclude_groups = {} })

vim.cmd("hi! StatusLine   cterm=none ctermfg=red ctermbg=red guifg=white guibg=none")
vim.cmd("hi! StatusLineNC cterm=none ctermfg=blue ctermbg=green guifg=white guibg=none")
