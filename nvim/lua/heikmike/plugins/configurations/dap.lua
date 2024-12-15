local dap = require("dap")

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "󰐊", texthl = "", linehl = "", numhl = "" })

-- Scala
-- Note that the adapater is managed bu Metals, so we don't need to specify it here
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
dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = pythonVenv(),
  },
}

dap.adapters.python = {
  type = "executable",
  command = pythonVenv(),
  args = { "-m", "debugpy.adapter" },
}
