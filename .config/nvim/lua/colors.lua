local cmd, opt, api = vim.cmd, vim.opt, vim.api

opt.termguicolors = true

cmd("hi! Normal gui=none guifg=#C7C8D0 guibg=#101010")
cmd("hi! StatusLine gui=none guifg=#262626 guibg=#262626")

cmd("hi! FgLightGray gui=none guifg=#C7C8D0 guibg=#101010")
cmd("hi! FgLightGrayBold gui=bold guifg=#C7C8D0 guibg=#101010")
cmd("hi! FgGray gui=none guifg=#808080 guibg=#101010")
cmd("hi! FgGrayBold gui=bold guifg=#808080 guibg=#101010")
cmd("hi! FgPaleOrange gui=none guifg=#E69875 guibg=#101010")
cmd("hi! FgPaleRed gui=none guifg=#E67E80 guibg=#101010")
cmd("hi! FgPaleRedBold gui=bold guifg=#E67E80 guibg=#101010")
cmd("hi! FgPaleBlue gui=none guifg=#7FBBB3 guibg=#101010")
cmd("hi! FgBlue gui=none guifg=#3465A4 guibg=#101010")
cmd("hi! FgBlueBold gui=bold guifg=#3465A4 guibg=#101010")
cmd("hi! FgPaleYellow gui=none guifg=#D3C6AA guibg=#101010")
cmd("hi! FgPaleYellowBold gui=bold guifg=#D3C6AA guibg=#101010")
cmd("hi! FgPaleJade gui=none guifg=#76AB85 guibg=#101010")
cmd("hi! FgPaleOlive gui=none guifg=#A7C080 guibg=#101010")
cmd("hi! FgPaleRose gui=none guifg=#D699B6 guibg=#101010")

cmd("hi! FgGreen gui=none guifg=#007400 guibg=#101010")
cmd("hi! FgBlood gui=none guifg=#800000 guibg=#101010")
cmd("hi! FgBloodItalic gui=italic guifg=#800000 guibg=#101010")
cmd("hi! FgBloodBold gui=bold guifg=#800000 guibg=#101010")
cmd("hi! FgDarkGray gui=none guifg=#262626 guibg=#101010")
cmd("hi! FgDarkGrayBold gui=bold guifg=#262626 guibg=#101010")

cmd("hi! BgGreen gui=none guifg=#007400 guibg=#007400")
cmd("hi! BgYellow gui=none guifg=#FFFF00 guibg=#FFFF00")
cmd("hi! BgBlood gui=none guifg=#800000 guibg=#800000")
cmd("hi! BgDarkGray gui=none guifg=#101010 guibg=#101010")
cmd("hi! BgGray gui=none guifg=#303030 guibg=#303030")
cmd("hi! BgBlack gui=none guifg=#000000 guibg=#000000")

cmd("hi! WhiteOnBlue gui=none guifg=#FFFFFF guibg=#3465A4")
cmd("hi! WhiteOnJade gui=none guifg=#FFFFFF guibg=#76AB85 ")
cmd("hi! WhiteOnBlood gui=none guifg=#FFFFFF guibg=#800000")
cmd("hi! LightGrayOnDarkGray gui=none guifg=#C7C8D0 guibg=#101010")
cmd("hi! OnDarkerGray gui=none guibg=#303030")
cmd("hi! GreenOnGray gui=none guifg=#007400 guibg=#303030")
cmd("hi! YellowOnGray gui=none guifg=#FFFF00 guibg=#303030")
cmd("hi! BloodOnGray gui=none guifg=#800000 guibg=#303030")
cmd("hi! LightGrayOnGray gui=none guifg=#C7C8D0 guibg=#808080")
cmd("hi! GrayOnDarkGray gui=none guifg=#808080 guibg=#101010")
cmd("hi! BlackOnWhite gui=none guifg=#000000 guibg=#FFFFFF")
cmd("hi! BlackOnDefYellow gui=none guifg=#000000 guibg=#FFE94F")

-- layout
cmd("hi! link SignColumn BgDarkGray")
cmd("hi! link VertSplit BgGray")
cmd("hi! link StatusLineNC BgDarkGray")
cmd("hi! link StatusLineTerm BgDarkGray")
cmd("hi! link EndOfBuffer BgDarkGray")
cmd("hi! link LineNr FgPaleOlive")
cmd("hi! link NERDTreeUp FgPaleBlue")
cmd("hi! link NERDTreeDir FgPaleBlue")
cmd("hi! link NERDTreeOpenable FgPaleBlue")
cmd("hi! link NERDTreeClosable FgPaleBlue")
cmd("hi! link NERDTreeLinkFile FgPaleBlue")

-- gutter
cmd("hi! link GitGutterAdd LightGrayOnDarkGray")
cmd("hi! link GitGutterChange LightGrayOnDarkGray")
cmd("hi! link GitGutterDelete LightGrayOnDarkGray")
cmd("hi! link GitGutterChangeDelete LightGrayOnDarkGray")
cmd("hi! link GitGutterAddLine LightGrayOnDarkGray")
cmd("hi! link GitGutterChangeLine LightGrayOnDarkGray")
cmd("hi! link GitGutterDeleteLine LightGrayOnDarkGray")
cmd("hi! link GitGutterChangeDeleteLine LightGrayOnDarkGray")
cmd("hi! link GitGutterAddLineNr LightGrayOnDarkGray")
cmd("hi! link GitGutterChangeLineNr LightGrayOnDarkGray")
cmd("hi! link GitGutterDeleteLineNr LightGrayOnDarkGray")
cmd("hi! link GitGutterChangeDeleteLineNr LightGrayOnDarkGray")

-- pmenu
cmd("hi! link Pmenu LightGrayOnDarkGray")
cmd("hi! link PmenuSel LightGrayOnGray")
cmd("hi! link PmenuSbar LightGrayOnGray")
cmd("hi! link PmenuThumb LightGrayOnGray")

-- diffs
cmd("hi! link DiffAdd OnDarkerGray")
cmd("hi! link DiffChange OnDarkerGray")
cmd("hi! link DiffDelete OnDarkerGray")
cmd("hi! link DiffText OnDarkerGray")
cmd("hi! link diffAdded FgGreen ")
cmd("hi! link diffRemoved FgBlood")
cmd("hi! link diffLine FgPaleJade")
cmd("hi! link diffIndexLine FgPaleJade")
cmd("hi! link diffSubname FgPaleBlue")

-- coverage
cmd("hi! link MyCoveragePyOk BgGreen")
cmd("hi! link MyCoveragePyWarn BgYellow")
cmd("hi! link MyCoveragePyError BgBlood")
cmd("hi! covered gui=none guifg=#007400 guibg=#007400")
cmd("hi! link uncovered BgBlood")
cmd("hi! link uncovered_nt BgBlood")

-- fugitive
cmd("hi! link fugitiveHeader FgPaleBlue")
cmd("hi! link fugitiveHeading FgPaleJade")
cmd("hi! link fugitiveSymbolicRef FgPaleBlue")
cmd("hi! link fugitiveHelpTag FgGray")
cmd("hi! link fugitiveUnstagedHeading FgPaleJade")
cmd("hi! link fugitiveUnstagedSection FgLightGray")
cmd("hi! link fugitiveUnstagedModifier FgGreen")
cmd("hi! link fugitiveStagedHeading FgPaleJade")
cmd("hi! link fugitiveStagedSection FgLightGray")
cmd("hi! link fugitiveStagedModifier FgGreen")
cmd("hi! link fugitiveCount FgPaleRose")
cmd("hi! link fugitiveHunk FgGray")
cmd("hi! link fugitiveHash FgPaleOrange")
cmd("hi! link fugitiveblameTime FgPaleJade")
cmd("hi! link fugitiveblameNotCommittedYet FgGray")
cmd("hi! link fugitiveblameDelimiter FgGray")

-- git
cmd("hi! link gitcommitComment FgPaleOrange")
cmd("hi! link gitcommitOnBranch FgPaleOrange")
cmd("hi! link gitcommitBranch FgPaleBlue")
cmd("hi! link gitcommitHeader FgPaleOrange")
cmd("hi! link gitcommitSelectedType FgPaleOrange")
cmd("hi! link gitcommitSelectedFile FgPaleJade")
cmd("hi! link gitDiff FgGray")
cmd("hi! link gitKeyword FgGray")
cmd("hi! link gitHash FgLightGray")
cmd("hi! link gitIdentityKeyword FgPaleJade")
cmd("hi! link gitEmail FgPaleJade")
cmd("hi! link gitEmailDelimiter FgPaleJade")
cmd("hi! link gitDate FgGray")

-- vim
cmd("hi! link vimSet FgPaleOrange")
cmd("hi! link vimCommand FgPaleOrange")
cmd("hi! link vimBracket FgPaleJade")
cmd("hi! link vimMapMod FgPaleJade")
cmd("hi! link vimMapModKey FgPaleJade")
cmd("hi! link vimMapLhs FgPaleJade")
cmd("hi! link vimNotation FgPaleJade")

-- markdown
cmd("hi! link mkdHeading FgPaleJade")
cmd("hi! link Title FgPaleJade")
cmd("hi! link mkdListItem FgPaleOrange")
cmd("hi! link mkdCode FgPaleRose")
cmd("hi! link mkdCodeDelimiter FgPaleRose")
cmd("hi! link VimwikiTag FgGreen")
cmd("hi! link markdownError NONE")

-- misc
cmd("hi! link Identifier FgBlue")
cmd("hi! link Visual WhiteOnBlue ")
cmd("hi! link VisualNOS WhiteOnBlue ")
cmd("hi! link Search BlackOnWhite")
cmd("hi! link Directory FgPaleOrange")
cmd("hi! link NormalFloat LightGrayOnDarkGray")
cmd("hi! link NonText FgLightGrayBold")
cmd("hi! link TelescopeMatching FgPaleJade")

api.nvim_set_hl(0, "@include", { link = "FgPaleBlue"})

api.nvim_set_hl(0, "@keyword", { link ="FgPaleBlue" })
api.nvim_set_hl(0, "@keyword.function", { link ="FgPaleBlue" })
api.nvim_set_hl(0, "@keyword.return", { link ="FgPaleBlue" })
api.nvim_set_hl(0, "@repeat", { link ="FgPaleBlue" })
api.nvim_set_hl(0, "@conditional", { link ="FgPaleBlue" })
api.nvim_set_hl(0, "@exception", { link ="FgPaleBlue" })
api.nvim_set_hl(0, "Type", { link ="FgPaleJade" })
api.nvim_set_hl(0, "@type", { link ="FgPaleJade" })
api.nvim_set_hl(0, "@type.builtin", { link ="FgPaleJade" })

api.nvim_set_hl(0, "@variable", { link ="FgLightGray" })
api.nvim_set_hl(0, "@field", { link ="FgLightGray" })
api.nvim_set_hl(0, "@property", { link ="FgPaleJade" })
api.nvim_set_hl(0, "@variable.builtin", { link ="FgGray" })

api.nvim_set_hl(0, "Special", { link ="FgPaleJade" })
api.nvim_set_hl(0, "Constant", { link ="FgPaleJade" })
api.nvim_set_hl(0, "@constant", { link ="FgPaleJade" })
api.nvim_set_hl(0, "@constant.builtin", { link ="FgPaleJade" })

api.nvim_set_hl(0, "@string", { link ="FgPaleRed" })
api.nvim_set_hl(0, "@string.escape", { link ="FgPaleRed" })
api.nvim_set_hl(0, "@float", { link ="FgPaleOrange" })
api.nvim_set_hl(0, "@boolean", { link ="FgPaleOrange" })
api.nvim_set_hl(0, "@number", { link ="FgPaleOrange" })

api.nvim_set_hl(0, "@function", { link ="FgPaleJade" })
api.nvim_set_hl(0, "@function.call", { link ="FgLightGray" })
api.nvim_set_hl(0, "@function.builtin", { link ="FgLightGray" })
api.nvim_set_hl(0, "@method", { link ="FgPaleJade" })
api.nvim_set_hl(0, "@method.call", { link ="FgLightGray" })
api.nvim_set_hl(0, "@constructor", { link ="FgPaleJade" })

api.nvim_set_hl(0, "@parameter", { link ="FgPaleJade" })

api.nvim_set_hl(0, "@operator", { link ="FgPaleJade" })
api.nvim_set_hl(0, "@punctuation.bracket", { link ="FgPaleJade" })
api.nvim_set_hl(0, "@punctuation.delimiter", { link ="FgPaleJade" })
api.nvim_set_hl(0, "@punctuation.special", { link ="FgPaleJade" })

api.nvim_set_hl(0, "Comment", { link ="FgPaleYellowBold" })
api.nvim_set_hl(0, "@comment", { link ="FgPaleYellowBold" })
api.nvim_set_hl(0, "Todo", { link ="FgBlueBold" })
api.nvim_set_hl(0, "@label", { link ="FgPaleJade" })

cmd.syntax([[match GTDLink "\[[a-zäöüßA-Z0-9\./:~_\-\(\)]*\]"]])
cmd([[hi! link GTDLink FgPaleBlue]])

cmd.syntax([[match Deadline "<[0-9\-]\+>"]])
cmd([[hi! link Deadline WhiteOnBlue]])

cmd.syntax([[match HighPriority "<high>"]])
cmd([[hi! link HighPriority WhiteOnBlood]])

cmd.syntax([[match TodoDone ".*✔$"]])
cmd([[hi! link TodoDone FgGray]])
