set termguicolors

" layout
hi Normal gui=none guifg=#00FF00 guibg=#000000
hi SignColumn gui=none guifg=#262626 guibg=#262626
hi VertSplit gui=none guifg=#262626 guibg=#262626
hi StatusLine gui=none guifg=#DADADA guibg=#262626
hi StatusLineNC gui=none guifg=#DADADA guibg=#262626
hi StatusLineTerm gui=none guifg=#DADADA guibg=#262626
hi EndOfBuffer gui=none guifg=#000000 guibg=#000000
hi LineNr gui=none guifg=#FFE94F guibg=#000000

" gutter
hi GitGutterAdd gui=none guifg=#DADADA guibg=#262626
hi GitGutterChange gui=none guifg=#DADADA guibg=#262626
hi GitGutterDelete gui=none guifg=#DADADA guibg=#262626
hi GitGutterChangeDelete gui=none guifg=#DADADA guibg=#262626
hi GitGutterAddLine gui=none guifg=#DADADA guibg=#262626
hi GitGutterChangeLine gui=none guifg=#DADADA guibg=#262626
hi GitGutterDeleteLine gui=none guifg=#DADADA guibg=#262626
hi GitGutterChangeDeleteLine gui=none guifg=#DADADA guibg=#262626
hi GitGutterAddLineNr gui=none guifg=#DADADA guibg=#262626
hi GitGutterChangeLineNr gui=none guifg=#DADADA guibg=#262626
hi GitGutterDeleteLineNr gui=none guifg=#DADADA guibg=#262626
hi GitGutterChangeDeleteLineNr gui=none guifg=#DADADA guibg=#262626

" code
hi TSInclude gui=none guifg=#00FFFF guibg=#000000

hi TSKeyword gui=none guifg=#FFE94F guibg=#000000
hi TSKeywordFunction gui=none guifg=#FFE94F guibg=#000000
hi TSKeywordReturn gui=none guifg=#FFE94F guibg=#000000
hi TSRepeat gui=none guifg=#FFE94F guibg=#000000
hi TSConditional gui=none guifg=#FFE94F guibg=#000000
hi TSException gui=none guifg=#FFE94F guibg=#000000
hi vimSet gui=none guifg=#FFE94F guibg=#000000
hi vimCommand gui=none guifg=#FFE94F guibg=#000000

hi TSType gui=none guifg=#87FFAF guibg=#000000
hi TSTypeBuiltin gui=none guifg=#87FFAF guibg=#000000

hi TSVariable gui=none guifg=#00FF00 guibg=#000000
hi TSVariableBuiltin gui=none guifg=#808080 guibg=#000000
hi TSField gui=none guifg=#00FF00 guibg=#000000

hi TSConstant gui=none guifg=#008030 guibg=#000000
hi TSConstBuiltin gui=none guifg=#008030 guibg=#000000

hi TSString gui=NONE guifg=#AD7FA8 guibg=#000000
hi TSStringEscape gui=NONE guifg=#AD7FA8 guibg=#000000
hi TSFloat gui=none guifg=#AD7FA8 guibg=#000000
hi TSBoolean gui=none guifg=#AD7FA8 guibg=#000000
hi TSNumber gui=none guifg=#AD7FA8 guibg=#000000

hi TSFunction gui=none guifg=#00FFFF guibg=#000000
hi TSFuncBuiltin gui=none guifg=#00FFFF guibg=#000000
hi TSConstructor gui=none guifg=#00FFFF guibg=#000000
hi TSMethod gui=none guifg=#00FFFF guibg=#000000

hi TSParameter gui=none guifg=#007400 guibg=#000000

hi TSOperator gui=none guifg=#007400 guibg=#000000
hi TSPunctBracket gui=none guifg=#00FF00 guibg=#000000
hi TSPunctDelimiter gui=none guifg=#00FF00 guibg=#000000
hi TSPunctSpecial gui=none guifg=#00FF00 guibg=#000000

hi Comment gui=italic guifg=#800000 guibg=#000000
hi TSComment gui=italic guifg=#800000 guibg=#000000
hi Todo gui=bold guifg=#800000 guibg=#000000

" pmenu
hi Pmenu gui=none guifg=#DADADA guibg=#262626
hi PmenuSel gui=none guifg=#DADADA guibg=#808080
hi PmenuSbar gui=none guifg=#DADADA guibg=#808080
hi PmenuThumb gui=none guifg=#DADADA guibg=#808080

" diffs
hi DiffAdd gui=none guifg=#FFFFFF guibg=#1C1C1C
hi DiffChange gui=none guifg=#FFFFFF guibg=#1C1C1C
hi DiffDelete gui=none guifg=#585858 guibg=#1C1C1C
hi DiffText gui=none guifg=#FFFFFF guibg=#1C1C1C

" coverage
hi default MyCoveragePyOk gui=none guifg=#005F00 guibg=#005F00
hi default MyCoveragePyWarn gui=none guifg=#FFFF00 guibg=#FFFF00
hi default MyCoveragePyError gui=none guifg=#800000 guibg=#800000
hi covered gui=none guifg=#005F00 guibg=#005F00
hi uncovered gui=none guifg=#800000 guibg=#800000
hi uncovered_nt gui=none guifg=#800000 guibg=#800000

" misc
hi Visual gui=none guifg=#000000 guibg=#FFE94F
hi VisualNOS gui=none guifg=#000000 guibg=#FFE94F
hi Search gui=none guifg=#000000 guibg=#FFFFFF
hi Directory gui=none guifg=#FFE94F
hi NormalFloat gui=none guibg=#1C1C1C guibg=#FFFFFF

