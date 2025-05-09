return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })()
        end,
        opts={
            ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "bash", "markdown","html" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        }
    }
}

