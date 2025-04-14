-- This file contains custom lua functions for latex----------------------------

-- initializing latex document
local function latex_initDoc()
    -- cleaning existing lines
    vim.cmd("normal! ggVGd")

    -- setting filetype to tex
    vim.cmd("set filetype=tex")

    -- writing filetype line
    vim.cmd("normal! i%&tex")

    -- writing documentclass type
    vim.cmd("normal! o\\documentclass{<>}")

    -- writing geometry package
    vim.cmd("normal! o")
    vim.cmd("normal! o\\usepackage[a4paper,margin=1in]{geometry}")

    -- writing graphicx package
    vim.cmd("normal! o")
    vim.cmd("normal! o\\usepackage{graphicx}")
    vim.cmd("normal! o\\graphicspath{{\"<>\"}}")

    -- writing cleveref package
    vim.cmd("normal! o")
    vim.cmd("normal! o\\usepackage{cleveref}")

    -- writing subcaption package
    vim.cmd("normal! o\\usepackage{subcaption}")

    -- writing title and author
    vim.cmd("normal! o")
    vim.cmd("normal! o\\title{<>}")
    vim.cmd("normal! o\\author{<>}")

    -- defining environment
    vim.cmd("normal! o")
    vim.cmd("normal! o\\begin{document}")
    vim.cmd("normal! o\\end{document}")
    vim.cmd("normal! O")
    vim.cmd("normal! o")
    vim.cmd("normal! s\\maketitle")
    vim.cmd("normal! o")
    vim.cmd("normal! o<>")
    vim.cmd("normal! o")

    -- going back to top
    vim.cmd("normal! gg0")
end
vim.api.nvim_create_user_command('LatexInitDoc',latex_initDoc,{})

-- creating environment
local function latex_beginEnv()
    -- getting environment name
    local envName = vim.fn.input("Environment Name: ")

    -- defining environment
    vim.cmd("normal! mM")
    vim.cmd("normal! o\\begin{"..envName.."}")
    vim.cmd("normal! o<>")
    vim.cmd("normal! o\\end{"..envName.."}")
    vim.cmd("normal! `M")
end
vim.api.nvim_create_user_command('LatexBeginEnv',latex_beginEnv,{})

-- tabular environment creator
local function latex_createTabular()
    vim.cmd("normal! o\\begin{tabular}{<>}")
    vim.cmd("normal! o\\end{tabular}")
    vim.cmd("normal! O<>")
    vim.cmd("normal! k0")
end
vim.api.nvim_create_user_command('LatexBeginTabular',latex_createTabular,{})

-- inserting math mode
local function latex_mathMode()
    vim.cmd("normal! a\\(\\)")
    vim.cmd("normal! h")
    vim.cmd("startinsert")
end
vim.api.nvim_create_user_command('LatexMathMode',latex_mathMode,{})

-- latex compilation
local function latex_compile()
    local fileName = vim.fn.expand("%")
    vim.cmd("update")
    -- vim.cmd("!pdflatex "..fileName)
    vim.cmd("tabnew term://pdflatex "..fileName)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>",true,true,true),"n",false)
end
vim.api.nvim_create_user_command('LatexCompile',latex_compile,{})

-- pdf viewer
local function latex_view()
    local fileName = vim.fn.expand("%")
    local name = vim.split(fileName,"tex")
    vim.cmd("!zathura "..name[1].."pdf > /dev/null 2>&1 &")
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>",true,true,true),"n",false)
end
vim.api.nvim_create_user_command('LatexView',latex_view,{})

-- bibtex compiler
local function latex_bibtex()
    local fileName = vim.fn.expand("%")
    local name = vim.split(fileName,".tex")
    vim.cmd("tabnew term://bibtex "..name[1]..".aux > /dev/null 2>&1 &")
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>",true,true,true),"n",false)
end
vim.api.nvim_create_user_command('LatexBibtex',latex_bibtex,{})
