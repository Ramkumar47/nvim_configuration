-- This file contains custom lua functions for quarto---------------------------

-- initializing section
local function quarto_initializeSection()
    vim.cmd("normal! o::: {}")
    vim.cmd("normal! o")
    vim.cmd("normal! o<>")
    vim.cmd("normal! o")
    vim.cmd("normal! o:::")
    vim.cmd("normal! 4kf{l")
    vim.cmd("startinsert")
end
vim.api.nvim_create_user_command('QuartoInitializeSection',quarto_initializeSection,{})

-- function quartoVimFunctions#InitializeColumns()
--
--     " writing columns skeleton
--  execute "normal! o\:\:\:\:\{.columns .v-center-container\}"
--     execute "normal! o\:\:\:\:"
--     execute "normal! k"
--
-- endfunction

local function quarto_initializeColumns()
    vim.cmd("normal! o:::: {.columns .v-center-container}")
    vim.cmd("normal! o")
    vim.cmd("normal! o::::")
    vim.cmd("normal! k")
end
vim.api.nvim_create_user_command('QuartoInitializeColumns',quarto_initializeColumns,{})
