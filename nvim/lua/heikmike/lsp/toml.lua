---@brief
---
--- https://tombi-toml.github.io/tombi/
---
--- Language server for Tombi, a TOML toolkit.
---

vim.lsp.config('tombils', {
  cmd = { 'tombi', 'lsp' },
  filetypes = { 'toml' },
  root_markers = { 'tombi.toml', 'pyproject.toml', '.git' },
})

vim.lsp.enable('tombils')

