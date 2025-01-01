local bind = vim.keymap.set
local telescope = require('telescope.builtin')
local dap = require('dap')
local widgets = require('dap.ui.widgets')

local my_on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }

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
  bind('n', '<leader>f', function()
  local current_file = vim.fn.expand('%:p') -- Get the full path of the current file
  local format_cmd = string.format("dart format %s", current_file)
  vim.fn.jobstart(format_cmd, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_exit = function(_, exit_code)
      if exit_code == 0 then
        vim.cmd("edit")
      else
        print("Error formatting file.")
      end
    end,
  })
  end, opts)

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
  bind('n', '<leader>tf', ':Telescope flutter commands<CR>', opts)
end

-- alternatively you can override the default configs
require("flutter-tools").setup {
  ui = {
    -- the border type to use for all floating windows, the same options/formats
    -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
    border = "rounded",
    -- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
    -- please note that this option is eventually going to be deprecated and users will need to
    -- depend on plugins like `nvim-notify` instead.
    notification_style = 'native'
  },
  decorations = {
    statusline = {
      -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
      -- this will show the current version of the flutter app from the pubspec.yaml file
      app_version = false,
      -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
      -- this will show the currently running device if an application was started with a specific
      -- device
      device = false,
      -- set to true to be able use the 'flutter_tools_decorations.project_config' in your statusline
      -- this will show the currently selected project configuration
      project_config = false,
    }
  },
  debugger = { -- integrate with nvim dap + install dart code debugger
    enabled = false,
    -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
    -- see |:help dap.set_exception_breakpoints()| for more info
    exception_breakpoints = {},
    -- Whether to call toString() on objects in debug views like hovers and the
    -- variables list.
    -- Invoking toString() has a performance cost and may introduce side-effects,
    -- although users may expected this functionality. null is treated like false.
    evaluate_to_string_in_debug_views = true,
    register_configurations = function(paths)
      require("dap").configurations.dart = {
        --put here config that you would find in .vscode/launch.json
      }
      -- If you want to load .vscode launch.json automatically run the following:
	  -- require("dap.ext.vscode").load_launchjs()
    end,
  },
  flutter_path = "/usr/bin/flutter", -- <-- this takes priority over the lookup
  flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
  root_patterns = { ".git", "pubspec.yaml" }, -- patterns to find the root of your flutter project
  fvm = false, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
  widget_guides = {
    enabled = false,
  },
  closing_tags = {
    highlight = "ErrorMsg", -- highlight for the closing tag
    prefix = ">", -- character to use for close tag e.g. > Widget
    priority = 10, -- priority of virtual text in current line
    -- consider to configure this when there is a possibility of multiple virtual text items in one line
    -- see `priority` option in |:help nvim_buf_set_extmark| for more info
    enabled = true -- set to false to disable
  },
  dev_log = {
    enabled = true,
    filter = nil, -- optional callback to filter the log
    -- takes a log_line as string argument; returns a boolean or nil;
    -- the log_line is only added to the output if the function returns true
    notify_errors = false, -- if there is an error whilst running then notify the user
    open_cmd = "15split", -- command to use to open the log buffer
    focus_on_open = true, -- focus on the newly opened log window
  },
  dev_tools = {
    autostart = false, -- autostart devtools server if not detected
    auto_open_browser = false, -- Automatically opens devtools in the browser
  },
  outline = {
    open_cmd = "30vnew", -- command to use to open the outline buffer
    auto_open = false -- if true this will open the outline automatically when it is first populated
  },
  lsp = {
    color = { -- show the derived colours for dart variables
      enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = false, -- highlight the background
      background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
      foreground = false, -- highlight the foreground
      virtual_text = true, -- show the highlight using virtual text
      virtual_text_str = "■", -- the virtual text character to highlight
    },
    on_attach = my_on_attach,
    capabilities = my_custom_capabilities, -- e.g. lsp_status capabilities
    --- OR you can specify a function to deactivate or change or control how the config is created
    capabilities = function(config)
      config.specificThingIDontWant = false
      return config
    end,
    -- see the link below for details on each option:
    -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      analysisExcludedFolders = {"<path-to-flutter-sdk-packages>"},
      renameFilesWithClasses = "prompt", -- "always"
      enableSnippets = true,
      updateImportsOnRename = true, -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
    }
  }
}

