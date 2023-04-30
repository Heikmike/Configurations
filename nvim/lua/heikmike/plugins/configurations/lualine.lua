local github_colors = require('github-theme.colors').setup({
    theme_style = "dark_default"
})
local github_util = require('github-theme.util')
local github_theme = require('lualine.themes.github_dark_default')

local tint_lualine_group = function(color)
    local group = {
        a = {bg = color, fg = github_colors.bg},
        b = {
            bg = github_util.darken(color, 0.2),
            fg = github_util.lighten(color, 0.2)
        },
        c = {
            bg = github_colors.bg,
            fg = github_util.lighten(color, 0.4, github_colors.fg)
        }
    }
    return group
end

github_theme.normal = tint_lualine_group(github_colors.red)
github_theme.insert = tint_lualine_group(github_colors.green)
github_theme.command = tint_lualine_group(github_colors.bright_magenta)
github_theme.visual = tint_lualine_group(github_colors.blue)
github_theme.replace = tint_lualine_group(github_colors.yellow)
github_theme.inactive.a = github_theme.normal.b
github_theme.inactive.c = {bg = github_colors.bg}

local coc_extension = {
    sections = {
        lualine_a = {{'filetype', separator = {left = '', right = ''}}}
    },
    filetypes = {
        'coc-explorer', 'dapui_breakpoints', 'dapui_scopes', 'dapui_stacks',
        'dapui_watches', 'dap-repl', 'dapui_console'
    }
}

require'lualine'.setup {
    options = {
        icons_enabled = true,
        theme = 'catppuccin',
        section_separators = {left = '', right = ''},
        component_separators = {left = '|', right = '|'},
        disabled_filetypes = { 'alpha', 'neo-tree' },
        always_divide_middle = true,
        globalstatus = true
    },
    sections = {
        lualine_a = {{'mode', separator = {left = '', right = ''}}},
        lualine_b = {
            'filename', 'diff',
            {'diagnostics', sources = {'nvim_diagnostic', 'coc'}}
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {'encoding', 'fileformat', 'filetype'},
        lualine_z = {{'location', separator = {left = '', right = ''}}}
    },
    inactive_sections = {
        lualine_a = {{'filename', separator = {left = '', right = ''}}},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {{'location', separator = {left = '', right = ''}}}
    },
    tabline = {},
    extensions = {coc_extension},
}

require("transparent").setup({enable = true, extra_groups = {}, exclude = {}})
