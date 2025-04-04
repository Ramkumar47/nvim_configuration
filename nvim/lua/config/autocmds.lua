-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_augroup("customAutoCmds",{clear=true})

-- removing trailing whitespaces with autocmd
vim.api.nvim_create_autocmd({'BufWritePre'},{command = "RemoveTrailingSpaces",
group="customAutoCmds"})

-- auto assign keymaps for C files
vim.api.nvim_create_autocmd("FileType",{
    pattern = {"cpp","C","c","h"},
    -- pattern = {"*.C","*.H","*.c","*.h","*.cpp"},
    callback= function()
        vim.keymap.set('n','<leader>is',':CInitializeHeader<CR>',{buffer=true})
    end,
})


