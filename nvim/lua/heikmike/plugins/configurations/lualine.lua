local fileFormatSymbols = {
  unix = "󰣇",
  dos = "",
  mac = "",
}

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "catppuccin",
    section_separators = {},
    component_separators = {},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {
      {
        "mode",
        icon = "",
        separator = { left = "", right = "" }
      }
    },
    lualine_b = {
      "filename",
      {
        "filetype",
        icon_only = true,
        separator = { left = '', right = '' }
      },
    },
    lualine_c = {
      {
        "branch",
        icon = "󰘬",
      },
      {
        "diagnostics", sources = { "nvim_diagnostic" }
      },
    },
    lualine_x = {
      { "location", },
    },
    lualine_y = {
      {
        "fileformat",
        symbols = fileFormatSymbols,
        separator = { left = "" }
      },
      {
        "datetime",
        style = "%B %d, %H:%M ",
      }
    },
    lualine_z = {
      {
        "hostname",
        separator = { left = "", right = "" },
      },
    },
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
  extensions = {},
})
