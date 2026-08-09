local bind = vim.keymap.set

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "Caddyfile",
  callback = function()
    vim.bo.filetype = "caddy"
  end,
})

vim.lsp.config("caddyls", {
  cmd = { "caddy-language-server" },
  filetypes = { "caddy" },
  root_markers = {
    "Caddyfile",
    "caddy.json"
  },
  on_attach = function(client, bufnr)
    bind('n', '<leader>fm', function() vim.cmd('silent exec "!caddy fmt --overwrite"') end)
  end,
})

vim.lsp.enable("caddyls")
