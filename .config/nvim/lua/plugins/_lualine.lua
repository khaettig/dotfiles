local colors = require("colors")

local b = { fg = colors.white, bg = colors.gray3 }
local c = { fg = colors.gray2, bg = colors.gray4 }
local y = { fg = colors.gray2, bg = colors.gray4 }
local z = { fg = colors.white, bg = colors.gray3, gui = 'bold' }

require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = {
            normal = { a = { fg = colors.gray5, bg = colors.gray2, gui = "bold" }, b = b, c = c, y = y, z = z },
            inactive = { a = { fg = colors.gray5, bg = colors.gray2, gui = "bold" }, b = b, c = c, y = y, z = z },
            insert = { a = { fg = colors.white, bg = colors.cerulean, gui = "bold" }, b = b, c = c, y = y, z = z },
            replace = { a = { fg = colors.white, bg = colors.blood, gui = "bold" }, b = b, c = c, y = y, z = z },
            visual = { a = { fg = colors.black, bg = colors.tan, gui = "bold" }, b = b, c = c, y = y, z = z },
            command = { a = { fg = colors.white, bg = colors.gray4, gui = "bold" }, b = b, c = c, y = y, z = z },
        },
        section_separators = { left = '', right = '' },
        component_separators = { left = ' ', right = ' ' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = {},
        lualine_y = { 'location' },
        lualine_z = { 'filetype' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
})
