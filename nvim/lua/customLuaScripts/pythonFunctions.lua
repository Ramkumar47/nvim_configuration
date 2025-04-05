-- This file contains custom lua functions for python---------------------------

-- initialization function
local function python_initializeScript()
    -- removing any previous entries
    vim.cmd("normal! ggVGd")
    vim.cmd("normal! i#!/bin/python3")

    -- writing header section
    vim.cmd("normal! o\"\"\"")
    vim.cmd("normal! 100A=")
    vim.cmd("normal! 0")
    vim.cmd("normal! 79lD")
    vim.cmd("normal! o<>")
    vim.cmd("normal! o")
    vim.cmd("normal! o")
    vim.cmd("normal! iRamkumar")
    vim.cmd(":r!date")
    vim.cmd("normal! o")
    vim.cmd("normal! 76A=")
    vim.cmd("normal! A\"\"\"")

    -- writing include modules section
    vim.cmd("normal! o")
    vim.cmd("normal! o# importing needed modules")
    vim.cmd("normal! oimport numpy as np")
    vim.cmd("normal! oimport pandas as pd")
    vim.cmd("normal! oimport matplotlib.pyplot as plt")

    -- writing horizontal line
    vim.cmd("normal! o")
    vim.cmd("normal! o#")
    vim.cmd("normal! 78A=")
    vim.cmd("normal! o")

    -- writing insert stamp
    vim.cmd("normal! o<>")
    vim.cmd("normal! o")

    -- writing horizontal line
    vim.cmd("normal! o")
    vim.cmd("normal! o#")
    vim.cmd("normal! 78A=")
    vim.cmd("normal! gg")
end
vim.api.nvim_create_user_command('PythonInitializeScript',python_initializeScript,{})

-- initializing plotting section
local function python_initializePlot()

    vim.cmd("normal! mA")

    -- setting plot font size
    vim.cmd("normal! oplt.rcParams.update({\"font.size\":15})")

    -- defining main figure
    vim.cmd("normal! oplt.figure(figsize=(16,9))")
    vim.cmd("normal! oplt.plot(<>)")
    vim.cmd("normal! oplt.grid()")
    vim.cmd("normal! oplt.xlabel(<>)")
    vim.cmd("normal! oplt.ylabel(<>)")
    vim.cmd("normal! oplt.title(<>)")
    vim.cmd("normal! o# plt.legend(loc=(1.01,0.75))")
    vim.cmd("normal! o# plt.savefig(<>,dpi=150,bbox_inches=\"tight\")")
    vim.cmd("normal! oplt.show()")
    vim.cmd("normal! o")

    vim.cmd("normal! 'A")
end
vim.api.nvim_create_user_command('PythonInitializePlot',python_initializePlot,{})
