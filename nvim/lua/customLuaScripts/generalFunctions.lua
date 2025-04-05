-- hori-dash function definition------------------------------------------------
local function horiDash()

    vim.cmd("normal! mM")
    vim.cmd("normal! 0")
    vim.cmd("normal! 100A-")
    vim.cmd("normal! 0")
    vim.cmd("normal! 80lD")
    vim.cmd("normal! `M")
end

vim.api.nvim_create_user_command('HoriDash',horiDash,{})
vim.keymap.set('n','<leader>hl',':HoriDash<CR>')

-- remove trailing spaces-------------------------------------------------------
local function removeTrailingSpaces()
    vim.cmd("normal! mT")
    -- vim.cmd("%s/\\s+$//e")
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.cmd("normal! `T")
end
vim.api.nvim_create_user_command('RemoveTrailingSpaces',removeTrailingSpaces,{})

-- BracketSub function----------------------------------------------------------
local function bracketSub()
    vim.cmd("call search('<>')")
    vim.cmd("normal! cf> ")
    vim.cmd("normal! x")
    vim.cmd("startinsert")
end
vim.api.nvim_create_user_command('BracketSub',bracketSub,{})
vim.keymap.set('n','<leader><leader>',':BracketSub<CR>')
