local telescope = require('telescope.builtin')
local cmp = require('cmp')
local luasnip = require('luasnip')
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
lsp.skip_server_setup({ 'rust_analyzer' })

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr }
  local bind = vim.keymap.set

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
  bind('n', '<leader>sd', function() vim.diagnostic.open_float() end, opts)
  bind('n', '<leader>sk', function() vim.lsp.diagnostic.goto_prev() end, opts)
  bind('n', '<leader>sj', function() vim.lsp.diagnostic.goto_next() end, opts)
  bind('n', '<leader>ss', function() telescope.diagnostics() end, opts)
  bind('n', '<leader>f', ':LspZeroFormat<CR>')
end)


lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = {
            "",
            "LspDiagnosticsDefaultWarning",
        },
        prefix = function(diagnostic)
          local diag_to_format = {
              [vim.diagnostic.severity.ERROR] = { "Error", "LspDiagnosticsDefaultError" },
              [vim.diagnostic.severity.WARN] = { "Warning", "LspDiagnosticsDefaultWarning" },
              [vim.diagnostic.severity.INFO] = { "Info", "LspDiagnosticsDefaultInfo" },
              [vim.diagnostic.severity.HINT] = { "Hint", "LspDiagnosticsDefaultHint" },
          }
          local res = diag_to_format[diagnostic.severity]
          return string.format("(%s) ", res[1]), res[2]
        end,
    },
})

-- initialize rust_analyzer with rust-tools
local rust_lsp = lsp.build_options('rust_analyzer', {
        single_file_support = false,
        on_attach = function(client, bufnr)
        end
    })
require('rust-tools').setup({ server = rust_lsp })

local dart_lsp = lsp.build_options('dartls', {
        single_file_support = false,
        on_attach = function(client, bufnr)
        lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                virtual_text = false,
            }
        )
        end
    })
require("flutter-tools").setup({ lsp = dart_lsp })
