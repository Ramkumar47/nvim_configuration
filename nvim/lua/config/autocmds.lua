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
vim.api.nvim_create_augroup("autoCmdsForC",{clear=true})
vim.api.nvim_create_autocmd("FileType",{
    pattern = {"cpp","C","c","h"},
    callback= function()
        vim.keymap.set('n','<leader>is',':CInitializeHeader<CR>',{buffer=true})
    end,
group="autoCmdsForC"})

-- auto assign keymaps for latex files
vim.api.nvim_create_augroup("autoCmdsForLatex",{clear=true})
vim.api.nvim_create_autocmd("FileType",{
    pattern = {"tex","plaintex"},
    callback= function()
        vim.keymap.set('n','<leader>id',':LatexInitDoc<CR>',{buffer=true})
        vim.keymap.set('n','<leader>be',':LatexBeginEnv<CR>',{buffer=true})
        vim.keymap.set('n','<leader>bt',':LatexBeginTabular<CR>',{buffer=true})
        vim.keymap.set('n','<leader>mm',':LatexMathMode<CR>',{buffer=true})
        vim.keymap.set('n','<F5>',':LatexCompile<CR>',{buffer=true})
        vim.keymap.set('n','<F6>',':LatexView<CR>',{buffer=true})
        vim.keymap.set('n','<F4>',':LatexBibtex<CR>',{buffer=true})
    end,
group="autoCmdsForLatex"})

-- auto assign keymaps for python files
vim.api.nvim_create_augroup("autoCmdsForPython",{clear=true})
vim.api.nvim_create_autocmd("FileType",{
    pattern = {"python"},
    callback= function()
        vim.keymap.set('n','<leader>is',':PythonInitializeScript<CR>',{buffer=true})
        vim.keymap.set('n','<leader>ip',':PythonInitializePlot<CR>',{buffer=true})
    end,
group="autoCmdsForPython"})

-- auto assign keymaps for quarto files
vim.api.nvim_create_augroup("autoCmdsForQuarto",{clear=true})
vim.api.nvim_create_autocmd("FileType",{
    pattern = {"quarto"},
    callback= function()
        vim.keymap.set('n','<leader>is',':QuartoInitializeSection<CR>',{buffer=true})
        vim.keymap.set('n','<leader>ic',':QuartoInitializeColumns<CR>',{buffer=true})
    end,
group="autoCmdsForQuarto"})

-- auto close terminal upon code complete
vim.api.nvim_create_autocmd("TermClose", {
    callback = function()
       vim.cmd("close")
    end
})
