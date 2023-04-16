set termguicolors
hi! Normal gui=none guifg=#C7C8D0 guibg=#101010
hi! StatusLine gui=none guifg=#262626 guibg=#262626

hi! FgLightGray gui=none guifg=#C7C8D0 guibg=#101010
hi! FgLightGrayBold gui=bold guifg=#C7C8D0 guibg=#101010
hi! FgGray gui=none guifg=#808080 guibg=#101010
hi! FgGrayBold gui=bold guifg=#808080 guibg=#101010
hi! FgPaleOrange gui=none guifg=#E69875 guibg=#101010
hi! FgPaleRed gui=none guifg=#E67E80 guibg=#101010
hi! FgPaleRedBold gui=bold guifg=#E67E80 guibg=#101010
hi! FgPaleBlue gui=none guifg=#7FBBB3 guibg=#101010
hi! FgBlue gui=none guifg=#3465A4 guibg=#101010
hi! FgBlueBold gui=bold guifg=#3465A4 guibg=#101010
hi! FgPaleYellow gui=none guifg=#D3C6AA guibg=#101010
hi! FgPaleYellowBold gui=bold guifg=#D3C6AA guibg=#101010
hi! FgPaleJade gui=none guifg=#76AB85 guibg=#101010
hi! FgPaleOlive gui=none guifg=#A7C080 guibg=#101010
hi! FgPaleRose gui=none guifg=#D699B6 guibg=#101010

hi! FgGreen gui=none guifg=#007400 guibg=#101010
hi! FgBlood gui=none guifg=#800000 guibg=#101010
hi! FgBloodItalic gui=italic guifg=#800000 guibg=#101010
hi! FgBloodBold gui=bold guifg=#800000 guibg=#101010
hi! FgDarkGray gui=none guifg=#262626 guibg=#101010
hi! FgDarkGrayBold gui=bold guifg=#262626 guibg=#101010

hi! BgGreen gui=none guifg=#007400 guibg=#007400
hi! BgYellow gui=none guifg=#FFFF00 guibg=#FFFF00
hi! BgBlood gui=none guifg=#800000 guibg=#800000
hi! BgDarkGray gui=none guifg=#101010 guibg=#101010
hi! BgGray gui=none guifg=#303030 guibg=#303030
hi! BgBlack gui=none guifg=#000000 guibg=#000000

hi! WhiteOnBlue gui=none guifg=#FFFFFF guibg=#3465A4
hi! WhiteOnJade gui=none guifg=#FFFFFF guibg=#76AB85 
hi! WhiteOnBlood gui=none guifg=#FFFFFF guibg=#800000
hi! LightGrayOnDarkGray gui=none guifg=#C7C8D0 guibg=#101010
hi! OnDarkerGray gui=none guibg=#303030
hi! GreenOnGray gui=none guifg=#007400 guibg=#303030
hi! YellowOnGray gui=none guifg=#FFFF00 guibg=#303030
hi! BloodOnGray gui=none guifg=#800000 guibg=#303030
hi! LightGrayOnGray gui=none guifg=#C7C8D0 guibg=#808080
hi! GrayOnDarkGray gui=none guifg=#808080 guibg=#101010
hi! BlackOnWhite gui=none guifg=#000000 guibg=#FFFFFF
hi! BlackOnDefYellow gui=none guifg=#000000 guibg=#FFE94F

" layout
hi! link SignColumn BgDarkGray
hi! link VertSplit BgGray
hi! link StatusLineNC BgDarkGray
hi! link StatusLineTerm BgDarkGray
hi! link EndOfBuffer BgDarkGray
hi! link LineNr FgPaleOlive
hi! link NERDTreeUp FgPaleBlue
hi! link NERDTreeDir FgPaleBlue
hi! link NERDTreeOpenable FgPaleBlue
hi! link NERDTreeClosable FgPaleBlue
hi! link NERDTreeLinkFile FgPaleBlue

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

" pmenu
hi! link Pmenu LightGrayOnDarkGray
hi! link PmenuSel LightGrayOnGray
hi! link PmenuSbar LightGrayOnGray
hi! link PmenuThumb LightGrayOnGray

" diffs
hi! link DiffAdd OnDarkerGray
hi! link DiffChange OnDarkerGray
hi! link DiffDelete OnDarkerGray
hi! link DiffText OnDarkerGray
hi! link diffAdded FgGreen 
hi! link diffRemoved FgBlood
hi! link diffLine FgPaleJade
hi! link diffIndexLine FgPaleJade
hi! link diffSubname FgPaleBlue

" coverage
hi! link MyCoveragePyOk BgGreen
hi! link MyCoveragePyWarn BgYellow
hi! link MyCoveragePyError BgBlood
hi! covered gui=none guifg=#007400 guibg=#007400
hi! link uncovered BgBlood
hi! link uncovered_nt BgBlood

" fugitive
hi! link fugitiveHeader FgPaleBlue
hi! link fugitiveHeading FgPaleJade
hi! link fugitiveSymbolicRef FgPaleBlue
hi! link fugitiveHelpTag FgGray
hi! link fugitiveUnstagedHeading FgPaleJade
hi! link fugitiveUnstagedSection FgLightGray
hi! link fugitiveUnstagedModifier FgGreen
hi! link fugitiveStagedHeading FgPaleJade
hi! link fugitiveStagedSection FgLightGray
hi! link fugitiveStagedModifier FgGreen
hi! link fugitiveCount FgPaleRose
hi! link fugitiveHunk FgGray
hi! link fugitiveHash FgPaleOrange
hi! link fugitiveblameTime FgPaleJade
hi! link fugitiveblameNotCommittedYet FgGray
hi! link fugitiveblameDelimiter FgGray

" git
hi! link gitcommitComment FgPaleOrange
hi! link gitcommitOnBranch FgPaleOrange
hi! link gitcommitBranch FgPaleBlue
hi! link gitcommitHeader FgPaleOrange
hi! link gitcommitSelectedType FgPaleOrange
hi! link gitcommitSelectedFile FgPaleJade
hi! link gitDiff FgGray
hi! link gitKeyword FgGray
hi! link gitHash FgLightGray
hi! link gitIdentityKeyword FgPaleJade
hi! link gitEmail FgPaleJade
hi! link gitEmailDelimiter FgPaleJade
hi! link gitDate FgGray

" vim
hi! link vimSet FgPaleOrange
hi! link vimCommand FgPaleOrange
hi! link vimBracket FgPaleJade
hi! link vimMapMod FgPaleJade
hi! link vimMapModKey FgPaleJade
hi! link vimMapLhs FgPaleJade
hi! link vimNotation FgPaleJade

" markdown
hi! link mkdHeading FgPaleJade
hi! link Title FgPaleJade
hi! link mkdListItem FgPaleOrange
hi! link mkdCode FgPaleRose
hi! link mkdCodeDelimiter FgPaleRose
hi! link VimwikiTag FgGreen

" misc
hi! link Identifier FgBlue
hi! link Visual WhiteOnBlue 
hi! link VisualNOS WhiteOnBlue 
hi! link Search BlackOnWhite
hi! link Directory FgPaleOrange
hi! link NormalFloat LightGrayOnDarkGray
hi! link NonText FgLightGrayBold
hi! link TelescopeMatching FgPaleJade
