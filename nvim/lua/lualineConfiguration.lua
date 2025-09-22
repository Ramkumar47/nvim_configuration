-- Lua line custom configuration, to be loaded in init.lua

local function mixedIndentStatus()
    local tabIndent = vim.fn.search('\t','nwc')
    local tabCount = vim.fn.searchcount({pattern='\t'}).total
    if tabCount > 1 then
        -- CurSearch is an existing highlight that matches the visual need
        return "%#CurSearch#MixedIndent%*"
    else
        return ''
    end
end

vim.api.nvim_set_hl(0, "customSpellCheckHighlight", { fg = "#4c4f69", bg = "#ea76cb", bold = true })

local function spellCheckStatus()
    if vim.opt.spell:get() then
        return string.format("%%#%s# SPELL %%#%s#", "customSpellCheckHighlight", "customSpellCheckHighlight")
    else
        return [[ ]]
    end
    vim.opt.spell=not(vim.opt.spell:get())
end

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'catppuccin',
    component_separators = {},
    section_separators = {},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {spellCheckStatus,'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location',mixedIndentStatus}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {mixedIndentStatus},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
