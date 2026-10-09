return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })()
        end,
        main = "nvim-treesitter.configs",
        opts={
            ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "bash", "markdown","html", "julia" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        }
    }
}

