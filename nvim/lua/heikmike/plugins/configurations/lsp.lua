local telescope = require('telescope.builtin')
local lsp = require('lsp-zero').preset({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = false,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = false,
  call_servers = 'local',
  sign_icons = {
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = ''
  }
})

lsp.ensure_installed({
  'lua_ls',
  'rust_analyzer',
})
lsp.skip_server_setup({ 'rust_analyzer', 'dartls' })

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr }
  local bind = vim.keymap.set
  local dap = require('dap')
  local widgets = require('dap.ui.widgets')

  bind('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
  bind('n', 'K', function() vim.lsp.buf.hover() end, opts)
  bind('n', '<C-k>', function() vim.lsp.buf.signature_help() end, opts)
  bind('n', '<leader>sa', function() vim.lsp.buf.code_action() end, opts)
  bind('n', 'gd', function() telescope.lsp_definitions() end, opts)
  bind('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
  bind('n', 'gt', function() telescope.lsp_type_definitions() end, opts)
  bind('n', 'gi', function() telescope.lsp_implementations() end, opts)
  bind('n', 'gr', function() telescope.lsp_references() end, opts)
  bind('n', 'go', function() telescope.lsp_document_symbols() end, opts)
  bind('n', 'gO', function() telescope.lsb_document_symbols() end, opts)
  bind('n', '<leader>sd', function() vim.diagnostic.open_float({ focusable = true }) end, opts)
  bind('n', '<leader>sk', function() vim.lsp.diagnostic.goto_prev() end, opts)
  bind('n', '<leader>sj', function() vim.lsp.diagnostic.goto_next() end, opts)
  bind('n', '<leader>ss', function() telescope.diagnostics() end, opts)
  bind('n', '<leader>f', ':LspZeroFormat<CR>')

  bind('n', '<leader>dc', function() dap.continue() end, opts)
  bind('n', '<leader>db', function() dap.toggle_breakpoint() end, opts)
  bind('n', '<leader>K', function() widgets.hover() end, opts)
  bind('n', '<leader>sc', function() widgets.cursor_float(widgets.scopes) end, opts)
  bind('n', '<leader>dn', function() dap.step_over() end, opts)
  bind('n', '<leader>ds', function() dap.step_into() end, opts)
  bind('n', '<leader>dr', function()
    dap.repl.toggle({ width = 20 }, 'vertical split')
    vim.cmd("wincmd h")
    vim.cmd("wincmd L")
    vim.cmd("wincmd h")
    -- vim.cmd("65 wincmd <")
  end, opts)
  bind('n', '<leader>dt', function() dap.terminate() end, opts)
  bind('n', '<leader>dl', function() dap.run_last() end, opts)
  bind('n', '<leader>dl', function() dap.run_last() end, opts)
  bind('n', '<leader>cb', function() dap.clear_breakpoints() end, opts)
end)

lsp.configure("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--cross-file-rename",
    "--completion-style=detailed",
    "--log=verbose",
  }
})

-- Disable diagnostics for gopls
-- lsp.configure("gopls", {
--   cmd = { "gopls", "-remote=auto" },
--   handlers = {
--     ["textDocument/publishDiagnostics"] = function() end
--   }
-- })

lsp.nvim_workspace()

lsp.setup()

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

local rust_lsp = lsp.build_options('rust_analyzer', {
  single_file_support = false,
  on_attach = function(_, _)
  end
})
require('rust-tools').setup({ server = rust_lsp })

