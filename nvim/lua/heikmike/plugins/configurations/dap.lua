-- INFO: Adapter = Debug server. Type "server" means we manually launch the server and we explain in the adapter how to connect to it. Type "executable"
-- means we explain in the adapter how Neovim should start the debug server
-- INFO: Configurations = Debugees, i.e. applications that are being debugged. "type" is the name of the adapter. Request "attach" means we manually
-- started the debugee and we specify how to reach out to it. 
local bind = vim.keymap.set
local dap = require("dap")
local widgets = require('dap.ui.widgets')

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "󰐊", texthl = "", linehl = "", numhl = "" })

-- Scala
-- Note that the adapater is managed by Metals, so we don't need to specify it here
dap.configurations.scala = {
  {
    type = "scala",
    request = "launch",
    name = "RunOrTest",
    metals = {
      runType = "runOrTestFile",
      --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
    },
  },
}

local pythonVenv = function()
  local venv = os.getenv('VIRTUAL_ENV')
  if venv then
    return venv .. '/bin/python3'
  else
    return '/usr/bin/python3'
  end
end

-- Python
-- How to connect to the debugging server
dap.adapters.python = {
  type = "executable",
  command = pythonVenv(),
  args = { "-m", "debugpy.adapter" },
}

-- Once connected to the debugging server, what to do
dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = pythonVenv(),
  },
  {
    type = "python",
    request = "launch",
    name = "Launch Main",
    program = "${workspaceFolder}/src/main.py",
    pythonPath = pythonVenv(),
    cwd = "${workspaceFolder}",
  },
}

--- JavaScript/TypeScript
--- Gets a path to a package in the Mason registry.
--- Prefer this to `get_package`, since the package might not always be
--- available yet and trigger errors.
---@param pkg string
---@param path? string
local function get_pkg_path(pkg, path)
  pcall(require, 'mason')
  local root = vim.env.MASON or (vim.fn.stdpath('data') .. '/mason')
  path = path or ''
  local ret = root .. '/packages/' .. pkg .. '/' .. path
  return ret
end

dap.adapters['pwa-node'] = {
  type = 'server',
  host = 'localhost',
  port = '${port}',
  executable = {
    command = 'node',
    args = {
      get_pkg_path('js-debug-adapter', '/js-debug/src/dapDebugServer.js'),
      '${port}',
    },
  },
}

for _, language in ipairs({ "typescript", "javascript" }) do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach by process",
      processId = require 'dap.utils'.pick_process,
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach to default debugging port",
      address = "127.0.0.1",
      port = 9229,
      restart = true,
      cwd = "${workspaceFolder}",
      skipFiles = { "<node_internals>/**" },
      sourceMaps = false,
    },
  }
end

-- Key bindings
bind('n', '<leader>dc', function() dap.continue() end)
bind('n', '<leader>db', function() dap.toggle_breakpoint() end)
bind('n', '<leader>K', function() widgets.hover() end)
bind('n', '<leader>sc', function() widgets.cursor_float(widgets.scopes) end)
bind('n', '<leader>dn', function() dap.step_over() end)
bind('n', '<leader>ds', function() dap.step_into() end)
bind('n', '<leader>dr', function()
  dap.repl.toggle({ width = 20 }, 'vertical split')
  vim.cmd("wincmd h")
  vim.cmd("wincmd L")
  vim.cmd("wincmd h")
  -- vim.cmd("65 wincmd <")
end)
bind('n', '<leader>dt', function()
  local session = assert(dap.session(), "has active session")
  if session.config and session.config.request == "attach" then
    dap.disconnect({ terminateDebugee = false })
  else
    dap.terminate()
  end
end)
bind('n', '<leader>dx', function()
  dap.terminate({
    disconnectArgs = { restart = true }
  })
end)
bind('n', '<leader>dl', function() dap.run_last() end)
bind('n', '<leader>cb', function() dap.clear_breakpoints() end)
