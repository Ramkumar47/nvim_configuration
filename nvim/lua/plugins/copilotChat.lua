return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
            temperature = 0.1,
            model = "Auto",
            trusted_tools = nil,
            window = {
                layout = "vertical",
                width = 0.3,
                border = "rounded",
                title = "AI Assistant",
                zindex = 100,
            },
            auto_insert_mode = true,
            headers = {
                user = '👤 RK',
                assistant = '🤖 Copilot',
                tool = '🔧 Tool',
            },

            separator = '━━',
            auto_fold = false, -- Automatically folds non-assistant messages
    },
  },
}
