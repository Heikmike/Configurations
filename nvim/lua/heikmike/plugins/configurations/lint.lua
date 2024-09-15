local lint = require('lint')

-- Custom linter for Go
lint.linters.go_linter = {
  cmd = 'golangci-lint',
  args = { 'run' },
  stream = 'stdout',
  -- Parses the output of golangci-lint for
  -- Neovim to understand
  parser = function(output, _, _)
    local items = {}
    for line in vim.gsplit(output, '\n') do
      local parts = vim.split(line, ':')

      if #parts < 4 then
        goto continue
      end

      local fullMessage = table.concat(parts, " ", 4)
      table.insert(items, {
        filename = parts[1],
        lnum = tonumber(parts[2] - 1),
        col = tonumber(parts[3]),
        message = fullMessage,
        severity = vim.lsp.protocol.DiagnosticSeverity.Error,
      })
      ::continue::
    end
    return items
  end,
}

lint.linters_by_ft = {
  go = { 'go_linter', },
  python = { 'flake8', },
}

-- Automatically run linters on save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end,
})
