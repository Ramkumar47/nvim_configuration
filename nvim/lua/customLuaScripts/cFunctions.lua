-- This file contains custom lua functions for C/C++ file-----------------------

-- " code header
-- " initialization---------------------------------------------------------------
-- function! CVimFunctions#InitializeHeader()
--     " removing any previous entries
--     execute "normal! ggVGd"
--
--     " writing header section
--     execute "normal! i/*"
--     execute "normal! 100A="
--     execute "normal! 0"
--     execute "normal! 77lD"
--     execute "normal! A*\\"
--     execute "normal! o*  <>"
--     execute "normal! o"
--     execute "normal! o* Ramkumar"
--     execute ":r!date"
--     execute "normal! I  * "
--     execute "normal! o"
--     execute "normal! I\\*"
--     execute "normal! 75A="
--     execute "normal! A*/"
--
--     " writing preprocessor directive
--     execute "normal! o"
--     execute "normal! o// preprocessor directives"
--     execute "normal! o<>"
--     execute "normal! o"
--
--     " writing horizontal line
--     execute "normal! o"
--     execute "normal! o/*"
--     execute "normal! 75A-"
--     execute "normal! A*/"
--     execute "normal! o"
--
--     " writing insert stamp
--     execute "normal! o<>"
--     execute "normal! o"
--
--     " writing horizontal line
--     execute "normal! o"
--     execute "normal! o/*"
--     execute "normal! 75A-"
--     execute "normal! A*/"
--     execute "normal! gg"
--
-- endfunction


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
    vim.cmd("normal! S\\*")
    vim.cmd("normal! 75A=")
    vim.cmd("normal! A*/")
end

vim.api.nvim_create_user_command('CInitializeHeader',C_initalizeHeader,{})
