require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
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
        lualine_z = { 'location' }
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
})

-- vim.g.lightline = {
--   colorscheme = "default",
--   separator = { left = "\ue0b8", right = "\ue0ba" },
--   active = {
--     left = { { "mode", "paste" },
--              { "gitbranch", "readonly", "filename", "modified" } },
--     right =  { {}, { "lineinfo" } , { 'filetype' },
--   },
--   inactive =  {
--     left = {{ "readonly", "filename", "modified" }},
--     right = {},
--   },
--   component_function = { gitbranch = "FugitiveHead" }
--   },
-- }
