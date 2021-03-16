" GTD
autocmd BufNewFile */Projects/*.md 0r Templates/project.md

" TODO
augroup DisableMappings
    autocmd! VimEnter * :vunmap a%
augroup END
