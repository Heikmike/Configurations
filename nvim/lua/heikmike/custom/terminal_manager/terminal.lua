-------------------------------------------------------------------------------
-- Terminal class.
-- @module terminal_manager
-- @author Yanis De Busschere <yanisdebusschere@gmail.com>
-- @license MIT
-------------------------------------------------------------------------------
-- Terminal class
--
-- @type Terminal
--
-- @field #string name
-- @field #string letter
-- @field #int buffer
local Terminal = {}

-- Terminal constructor.
--
-- @function [parent=#Terminal] New
--
-- @param #string name
-- @param #string letter
-- @param #int buffer
--
-- @return #Terminal
function Terminal:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.letter = o.letter or ""
    self.name = o.name or ("Terminal " .. self.letter)
    self.buffer = o.buffer or -1
    return o
end

-- Open the terminal.
--
-- @function [parent=#Terminal] Open
--
-- @param #string commandToRun Command to run.
--
-- @return #Terminal
function Terminal:Open(commandToRun)
    local current_buffer = vim.fn.bufnr()
    if not self:GoToTerminalWindow() then self:CreateTerminalWindow() end

    if self.buffer == -1 or not vim.api.nvim_buf_is_loaded(self.buffer) then
        vim.cmd("terminal " .. commandToRun)
        self.buffer = vim.api.nvim_get_current_buf()
        vim.api.nvim_buf_set_name(self.buffer, self.name)
        vim.api.nvim_buf_set_option(self.buffer, "buflisted", false)
    end
    vim.api.nvim_win_set_buf(0, self.buffer)
    if commandToRun == nil or commandToRun == "" then vim.cmd("startinsert") end
end

-- Go the the terminal window.
--
-- @function [parent=#Terminal] GoToTerminalWindow
--
-- @return #boolean True if the terminal window was found, false otherwise.
function Terminal:GoToTerminalWindow()
    local windows = vim.api.nvim_tabpage_list_wins(0)
    local terminalWindowIndex = nil
    for index, window in ipairs(windows) do
        if vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(window),
                                       "buftype") == "terminal" then
            terminalWindowIndex = index
        end
    end
    if terminalWindowIndex ~= nil then
        vim.cmd(terminalWindowIndex .. "wincmd w")
        return true
    end
    return false
end

-- Create the terminal window.
--
-- @function [parent=#Terminal] CreateTerminalWindow
function Terminal:CreateTerminalWindow()
    vim.cmd("belowright new")
    vim.cmd("resize 12")
end

return Terminal
