return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,    -- make sure we load this during startup
        priority = 1000, -- make sure to load this before all the other start plugins
        opts = {
                flavor="mocha",
                transparent_background=true
        }
    }
}


