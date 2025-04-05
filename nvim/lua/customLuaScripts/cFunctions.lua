-- This file contains custom lua functions for C/C++ file-----------------------

local function C_initalizeHeader()

    -- removing any previous entries
    vim.cmd("normal! ggVGd")

    -- writing header section
    vim.cmd("normal! i/*")
    vim.cmd("normal! 100A=")
    vim.cmd("normal! 0")
    vim.cmd("normal! 77lD")
    vim.cmd("normal! A*\\")
    vim.cmd("normal! o<>")
    vim.cmd("normal! o")
    vim.cmd("normal! oRamkumar")
    vim.cmd(":r!date")
    vim.cmd("normal! I * ")
    vim.cmd("normal! o")
    vim.cmd("normal! 0D")
    vim.cmd("normal! I\\*")
    vim.cmd("normal! 75A=")
    vim.cmd("normal! A*/")

    -- writing preprocessor directive
    vim.cmd("normal! o")
    vim.cmd("normal! o// preprocessor directives")
    vim.cmd("normal! o")
    vim.cmd("normal! 0C<>")
    -- vim.cmd("normal! o<>")

    -- writing horizontal line
    vim.cmd("normal! o")
    vim.cmd("normal! o/*")
    vim.cmd("normal! 75A-")
    vim.cmd("normal! A*/")
    vim.cmd("normal! o")

    -- writing insert stamp
    vim.cmd("normal! o<>")
    vim.cmd("normal! o")

    -- writing horizontal line
    vim.cmd("normal! o")
    vim.cmd("normal! o/*")
    vim.cmd("normal! 75A-")
    vim.cmd("normal! A*/")
    vim.cmd("normal! gg0")

end

vim.api.nvim_create_user_command('CInitializeHeader',C_initalizeHeader,{})
