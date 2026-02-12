function ColorMyPencils(color)
  local vim = vim
  color = 'kanagawa'

  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "StatusLine", { link = "Normal" })
end

ColorMyPencils()
