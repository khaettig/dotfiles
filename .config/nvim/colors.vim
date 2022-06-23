set termguicolors

hi! Normal gui=none guifg=#00FF00 guibg=#000000
hi! StatusLine gui=none guifg=#262626 guibg=#262626

hi! FgLime gui=none guifg=#00FF00 guibg=#000000
hi! FgGreen gui=none guifg=#007400 guibg=#000000
hi! FgMint gui=none guifg=#87FFAF guibg=#000000
hi! FgJade gui=none guifg=#008030 guibg=#000000
hi! FgDefYellow gui=none guifg=#FFE94F guibg=#000000
hi! FgCyan gui=none guifg=#00FFFF guibg=#000000
hi! FgBlue gui=none guifg=#3465A4 guibg=#000000
hi! FgBlueItalic gui=italic guifg=#3465A4 guibg=#000000
hi! FgBlueBold gui=bold guifg=#3465A4 guibg=#000000
hi! FgPurple gui=none guifg=#AD7FA8 guibg=#000000
hi! FgBlood gui=none guifg=#800000 guibg=#000000
hi! FgBloodItalic gui=italic guifg=#800000 guibg=#000000
hi! FgBloodBold gui=bold guifg=#800000 guibg=#000000
hi! FgLightGray gui=none guifg=#DADADA guibg=#000000
hi! FgGray gui=none guifg=#808080 guibg=#000000
hi! FgDarkGray gui=none guifg=#262626 guibg=#000000

hi! BgGreen gui=none guifg=#007400 guibg=#007400
hi! BgYellow gui=none guifg=#FFFF00 guibg=#FFFF00
hi! BgBlood gui=none guifg=#800000 guibg=#800000
hi! BgDarkGray gui=none guifg=#262626 guibg=#262626
hi! BgBlack gui=none guifg=#000000 guibg=#000000

hi! WhiteOnBlue gui=none guifg=#FFFFFF guibg=#3465A4
hi! LightGrayOnDarkGray gui=none guifg=#DADADA guibg=#262626
hi! LightGrayOnGray gui=none guifg=#DADADA guibg=#808080
hi! GrayOnDarkGray gui=none guifg=#808080 guibg=#262626
hi! BlackOnWhite gui=none guifg=#000000 guibg=#FFFFFF
hi! BlackOnDefYellow gui=none guifg=#000000 guibg=#FFE94F

" layout
hi! link SignColumn BgDarkGray
hi! link VertSplit BgDarkGray
hi! link StatusLineNC BgDarkGray
hi! link StatusLineTerm BgDarkGray
hi! link EndOfBuffer BgBlack
hi! link LineNr FgDefYellow

" gutter
hi! link GitGutterAdd LightGrayOnDarkGray
hi! link GitGutterChange LightGrayOnDarkGray
hi! link GitGutterDelete LightGrayOnDarkGray
hi! link GitGutterChangeDelete LightGrayOnDarkGray
hi! link GitGutterAddLine LightGrayOnDarkGray
hi! link GitGutterChangeLine LightGrayOnDarkGray
hi! link GitGutterDeleteLine LightGrayOnDarkGray
hi! link GitGutterChangeDeleteLine LightGrayOnDarkGray
hi! link GitGutterAddLineNr LightGrayOnDarkGray
hi! link GitGutterChangeLineNr LightGrayOnDarkGray
hi! link GitGutterDeleteLineNr LightGrayOnDarkGray
hi! link GitGutterChangeDeleteLineNr LightGrayOnDarkGray

" code
hi! link TSInclude FgCyan

hi! link TSKeyword FgDefYellow
hi! link TSKeywordFunction FgDefYellow
hi! link TSKeywordReturn FgDefYellow
hi! link TSRepeat FgDefYellow
hi! link TSConditional FgDefYellow
hi! link TSException FgDefYellow
hi! link TSType FgMint
hi! link TSTypeBuiltin FgMint

hi! link TSVariable FgLime
hi! link TSField FgLime
hi! link TSProperty FgLime
hi! link TSVariableBuiltin FgGray

hi! link TSConstant FgMint
hi! link TSConstBuiltin FgMint

hi! link TSString FgPurple
hi! link TSStringEscape FgPurple
hi! link TSFloat FgPurple
hi! link TSBoolean FgPurple
hi! link TSNumber FgPurple

hi! link TSFunction FgLime
hi! link TSFuncBuiltin FgLime
hi! link TSMethod FgLime
hi! link TSConstructor FgCyan

hi! link TSParameter FgMint

hi! link TSOperator FgLime
hi! link TSPunctBracket FgLime
hi! link TSPunctDelimiter FgLime
hi! link TSPunctSpecial FgLime

hi! link Comment FgBlueBold
hi! link TSComment FgBlueBold

" pmenu
hi! link Pmenu LightGrayOnDarkGray
hi! link PmenuSel LightGrayOnGray
hi! link PmenuSbar LightGrayOnGray
hi! link PmenuThumb LightGrayOnGray

" diffs
hi! link DiffAdd LightGrayOnDarkGray
hi! link DiffChange LightGrayOnDarkGray
hi! link DiffDelete GrayOnDarkGray
hi! link DiffText LightGrayOnDarkGray
hi! link diffAdded FgGreen 
hi! link diffRemoved FgBlood
hi! link diffLine FgMint
hi! link diffIndexLine FgMint
hi! link diffSubname FgCyan

" coverage
hi! link MyCoveragePyOk BgGreen
hi! link MyCoveragePyWarn BgYellow
hi! link MyCoveragePyError BgBlood
hi! covered gui=none guifg=#007400 guibg=#007400
hi! link uncovered BgBlood
hi! link uncovered_nt BgBlood

" fugitive
hi! link fugitiveHeader FgDefYellow
hi! link fugitiveHeading FgMint
hi! link fugitiveSymbolicRef FgCyan
hi! link fugitiveHelpTag FgGray
hi! link fugitiveUnstagedHeading FgMint
hi! link fugitiveUnstagedSection FgLime
hi! link fugitiveUnstagedModifier FgGreen
hi! link fugitiveStagedHeading FgMint
hi! link fugitiveStagedSection FgLime
hi! link fugitiveStagedModifier FgGreen
hi! link fugitiveCount FgPurple
hi! link fugitiveHunk FgGray
hi! link fugitiveHash FgJade
hi! link fugitiveblameTime FgMint
hi! link fugitiveblameNotCommittedYet FgGray
hi! link fugitiveblameDelimiter FgGray

" git
hi! link gitcommitComment FgJade
hi! link gitcommitOnBranch FgJade
hi! link gitcommitBranch FgDefYellow
hi! link gitcommitHeader FgJade
hi! link gitcommitSelectedType FgJade
hi! link gitcommitSelectedFile FgMint
hi! link gitDiff FgGray
hi! link gitKeyword FgGray
hi! link gitHash FgLime
hi! link gitIdentityKeyword FgMint
hi! link gitEmail FgMint
hi! link gitEmailDelimiter FgMint
hi! link gitDate FgGray

" vim
hi! link vimSet FgDefYellow
hi! link vimCommand FgDefYellow
hi! link vimBracket FgMint
hi! link vimMapMod FgMint
hi! link vimMapModKey FgMint
hi! link vimMapLhs FgMint
hi! link vimNotation FgMint

" markdown
hi! link mkdHeading FgMint
hi! link Title FgMint
hi! link mkdListItem FgJade
hi! link mkdCode FgPurple
hi! link mkdCodeDelimiter FgPurple

" misc
hi! link Visual WhiteOnBlue 
hi! link VisualNOS WhiteOnBlue 
hi! link Search BlackOnWhite
hi! link Directory FgDefYellow
hi! link NormalFloat LightGrayOnDarkGray
