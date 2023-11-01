vim.cmd.highlight("clear")
vim.cmd.colorscheme("default")
vim.g.colors_name="calm"

local colors = require("colors")
local fg = colors.gray1
local bg = colors.gray5

NotSetCounter = 0
local function not_set()
    local not_set_fg = "#00" .. string.format("%02x", NotSetCounter) .. "FF"
    local not_set_bg = "#FF" .. string.format("%02x", NotSetCounter) .. "FF"
    local not_set_sp = "#FF" .. string.format("%02x", NotSetCounter) .. "00"
    NotSetCounter = NotSetCounter + 1
    if NotSetCounter > 2^16 - 1 then NotSetCounter = 0 end
    return { fg=not_set_fg, bg=not_set_bg, sp=not_set_sp }
end

local function highlight(groups)
    for name, opts in pairs(groups) do
        if not opts.force then opts.force = true end
        vim.api.nvim_set_hl(0, name, opts)
    end
end

highlight({
    ColorColumn = { bg=colors.gray4 },
    Comment = { fg=colors.tan },
    Conceal = not_set(),
    Constant = { fg=colors.coral },
    CurSearch = { fg=colors.gray5, bg=colors.gray2 },
    Cursor = not_set(),
    CursorColumn = not_set(),
    CursorIM = not_set(),
    CursorLine = { bg=colors.gray3 },
    CursorLineFold = not_set(),
    CursorLineNr = not_set(),
    CursorLineSign = { bg=colors.gray3 },
    DiffAdd = { fg=fg, bg=bg },
    DiffChange = { fg=fg, bg=bg },
    DiffDelete = { fg=fg, bg=bg },
    DiffText = not_set(),
    Directory = { fg=colors.cerulean },
    EndOfBuffer = { fg=bg, bg=bg },
    ErrorMsg = { fg=colors.white, bg=colors.blood },
    FloatBorder = not_set(),
    FloatFooter = not_set(),
    FloatTitle = not_set(),
    FoldColumn = not_set(),
    Folded = not_set(),
    Identifier = { fg=colors.cerulean },
    IncSearch = { fg=colors.gray5, bg=colors.gray2 },
    LineNr = { fg=colors.olive, bg=colors.gray5 },
    LineNrAbove = { fg=colors.olive, bg=colors.gray5 },
    LineNrBelow = { fg=colors.olive, bg=colors.gray5 },
    MatchParen = { fg=colors.fern, bg=colors.cerulean },
    ModeMsg = { fg=fg, bold=true },
    MoreMsg = { fg=fg },
    MsgArea = { fg=fg },
    MsgSeparator = { bg=bg },
    NonText = { fg=fg, bg=bg },
    Normal = { fg=fg, bg=bg },
    NormalFloat = { bg=colors.gray4 },
    NormalNC = { fg=fg, bg=bg },
    Pmenu = { bg=colors.gray4 },
    PmenuExtra = not_set(),
    PmenuExtraSel = not_set(),
    PmenuKind = not_set(),
    PmenuKindSel = not_set(),
    PmenuSbar = { bg=colors.gray4 },
    PmenuSel = { bg=colors.gray3 },
    PmenuThumb = { bg=colors.gray4 },
    PreProc = { fg=colors.fern },
    Question = { bg=bg },
    QuickFixLine = not_set(),
    Search = { fg=colors.gray5, bg=colors.white },
    SignColumn = { fg=colors.gray5, bg=colors.gray5 },
    Special = { fg=colors.teal },
    SpecialKey = { fg=colors.cerulean },
    SpellBad = not_set(),
    SpellCap = not_set(),
    SpellLocal = not_set(),
    SpellRare = not_set(),
    Statement = { fg=colors.teal },
    StatusLine = { fg=colors.gray3, bg=colors.gray3 },
    StatusLineNC = { fg=colors.gray3, bg=colors.gray3 },
    Substitute = not_set(),
    TabLine = not_set(),
    TabLineFill = not_set(),
    TabLineSel = not_set(),
    TermCursor = not_set(),
    TermCursorNC = not_set(),
    Title = { bg=colors.gray3 },
    Type = { fg=colors.teal },
    Visual = { fg=colors.white, bg=colors.cerulean },
    VisualNOS = { fg=colors.white, bg=colors.cerulean },
    WarningMsg = not_set(),
    Whitespace = not_set(),
    WildMenu = not_set(),
    WinBar = { bg=colors.gray4 },
    WinBarNC = { bg=colors.gray4 },
    WinSeparator = { fg=colors.gray3, bg=colors.gray3 },
    lCursor = not_set(),

    ["@operator"] = { fg=colors.fern },
    ["@punctuation"] = { fg=colors.fern },
    ["@constructor"] = { fg=colors.fern },

    NvimTreeRootFolder = { fg=colors.fern },
})
