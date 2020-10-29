# Vim

## Shortcuts
* &lt;F3&gt; open vimrc
* &lt;F4&gt; source vimrc and update plugins
* &lt;F5&gt; run and build app (.localrc)
* &lt;F6&gt; run unit tests (.localrc)
* &lt;F7&gt; run e2e tests (.localrc)

## Splits
* &lt;C-w&gt; _ Max out split height
* &lt;C-w&gt; | Max out split width
* &lt;C-w&gt; = Normalize splits
* &lt;C-W&gt; R Swap splits
* &lt;C-W&gt; K/H Switch horizontal/vertical

## Motions
* **w**ord
* word **b**ackward
* end of a word **ä**
* **f**ind character/un**t**il (F/T backwards)
* **/** search

## Commands
* **d**elete
* **c**hange
* **y**ank
* **&lt;/&gt;** indent
* **=** reformat

## Text Objects
* i**n**ner **w**ord
* also with **p**aragraph, and **)**, **'**, **"**, **t**

## Misc
* 0 Beginning of the line
* $ End of the line
* ~ Toggle case under cursor/visually-selected
* &lt;C-l&gt; scroll up
* &lt;C-a&gt; scroll down
* :args pattern Add files to arglist
* :argdo command | update Do command in all argfiles
* :argdo %s/pattern/gec | update Search and replace (e is  to ignore errors)
* :argd pattern Remove files from arglist

## Vim-Surround
* cs'/" change surrounding '/"

## ALE
* &lt;C-n&gt; go to next problem
* &lt;C-f&gt; use fixer

## EasyMotion
* &lt;Leader&gt;w word
* &lt;Leader&gt;b word backwards
* &lt;Leader&gt;f find (one character)
* &lt;Leader&gt;s find backwards (one character)

## NERDTree
* &lt;C-y&gt; Toggle
* &lt;Leader&gt;&lt;C-y&gt; Toggle and go to current file
* s for vertical split
* i for horizontal split
* m to open the filesystem menu

## Ctrlp
* &lt;C-x&gt; for vertical split
* &lt;C-v&gt; for horizontal split

## Vim-Test
* &lt;Leader&gt;an :TestNearest
* &lt;Leader&gt;af :TestFile
* &lt;Leader&gt;al :TestLast
* &lt;Leader&gt;av :TestVisit

## Fugitive
* :G git status
* :Git command
* = show inline div
* X check out -- file
* cc in git window, commit
* dd show all diffs
* :G mergetool Load conflicts into quickfix list
* :copen Open quickfix list
* &lt;Leader&gt;gf Turn off autoformatting
* &lt;Leader&gt;ge Get left version
* &lt;Leader&gt;gn Get right version
* &lt;Leader&gt;gd Open three-way-split for this file
* &lt;C-W&gt;O Close other splits
* ßf find next conflict tag
* ßß save and go to next conflict
* ßq go to next conflict
* ẞq go to previeous conflict
* :Gedit branch:% open this file from other branch
* :Gvdiff branch:% diff this file to other branch
* :diffget to get changes from other branch

## Deoplete
* &lt;C-n&gt; Autocomplete next
* &lt;C-p&gt; Autocomplete previous

# Tmux
* &lt;C-b&gt;z Toggle pane maximization

# Git
* commit --amend to amend forgotten changes to last commit
* git checkout -m &lt;file&gt; to reload files with conflicts
* git log develop..branch to show commits in branch and not in develop

# Terminal
* &lt;C-+&gt;/&lt;C--&gt;/&lt;C-0&gt; Zoom
* cd - Move to last directory
* setxkbmap fr set keyboard to french
* setxkbmap de neo set keybord to neo2
