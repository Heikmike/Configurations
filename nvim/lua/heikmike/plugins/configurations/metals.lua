local api = vim.api
local telescope = require("telescope.builtin")

----------------------------------
-- OPTIONS -----------------------
----------------------------------
-- global
vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt_global.shortmess:remove("F")

----------------------------------
-- LSP Setup ---------------------
----------------------------------
local metals_config = require("metals").bare_config()

metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}
metals_config.init_options.statusBarProvider = "off"
metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Debug settings if you're using nvim-dap
local widgets = require("dap.ui.widgets")
local dap = require("dap")

metals_config.on_attach = function(client, bufnr)
  require("metals").setup_dap()

  local opts = { buffer = bufnr }
  local bind = vim.keymap.set

  bind('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
  bind('n', 'K', function() vim.lsp.buf.hover() end, opts)
  bind('n', '<C-k>', function() vim.lsp.buf.signature_help() end, opts)
  bind('n', '<leader>sa', function() vim.lsp.buf.code_action() end, opts)
  bind('n', 'gd', function() telescope.lsp_definitions() end, opts)
  bind('n', 'gt', function() telescope.lsp_type_definitions() end, opts)
  bind('n', 'gi', function() telescope.lsp_implementations() end, opts)
  bind('n', 'gr', function() telescope.lsp_references() end, opts)
  bind('n', 'go', function() telescope.lsp_document_symbols() end, opts)
  bind('n', 'gO', function() telescope.lsb_document_symbols() end, opts)
  bind('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
  bind('n', '<leader>cl', function() vim.lsp.codelens.run() end, opts)
  bind('n', '<leader>sd', function() vim.diagnostic.open_float({ focusable = true }) end, opts)
  bind('n', '<leader>sk', function() vim.lsp.diagnostic.goto_prev() end, opts)
  bind('n', '<leader>sj', function() vim.lsp.diagnostic.goto_next() end, opts)
  bind('n', '<leader>ss', function() telescope.diagnostics() end, opts)
  bind('n', '<leader>dc', function() dap.continue() end, opts)
  bind('n', '<leader>db', function() dap.toggle_breakpoint() end, opts)
  bind('n', '<leader>K', function() widgets.hover() end, opts)
  bind('n', '<leader>sc', function() widgets.cursor_float(widgets.scopes) end, opts)
  bind('n', '<leader>dn', function() dap.step_over() end, opts)
  bind('n', '<leader>ds', function() dap.step_into() end, opts)
  bind('n', '<leader>dr', function() dap.repl.toggle() end, opts)
  bind('n', '<leader>dt', function() dap.terminate() end, opts)
  bind("n", "<leader>f", vim.lsp.buf.format)
end

-- Autocmd that will actually be in charging of starting the whole thing
local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})

vim.opt_global.shortmess:remove("F")
