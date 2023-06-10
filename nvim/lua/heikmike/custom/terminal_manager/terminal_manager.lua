-------------------------------------------------------------------------------
-- Set of function to manage terminals.
-- @module terminal_manager
-- @author Yanis De Busschere <yanisdebusschere@gmail.com>
-- @license MIT
-------------------------------------------------------------------------------
local Terminal = require("heikmike.custom.terminal_manager.terminal")

local M = {}

-- Map of terminals. Key is the letter of the terminal. Value is the terminal.
local terminals = {}

-- Open a new terminal creating a new one if there is no terminal with the same letter.
-- @param #string letter Letter of the terminal.
-- @param #string commandToRun Command to run.
function M.OpenTerm(letter, commandToRun)
    if letter == nil or letter == "" then
        return
    end

    letter = string.upper(letter)

    if letter == "P" and terminals[letter] ~= nil and commandToRun ~= nil and commandToRun ~= "" then
        vim.api.nvim_buf_delete(terminals[letter].buffer, { force = true })
        terminals[letter] = nil
    end

    if terminals[letter] == nil then
        terminals[letter] = Terminal:new({
            letter = letter,
            name = "Terminal " .. letter,
            buffer = -1
        })
    end
    terminals[letter]:Open(commandToRun)
end

return M
