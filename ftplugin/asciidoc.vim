setlocal spell
set spelllang=en_us,es
" Add support for auto save
let g:auto_save = 1

" Autocompile on save based on
" https://github.com/JamshedVesuna/vim-markdown-preview/blob/master/plugin/vim-markdown-preview.vim
"https://stackoverflow.com/a/4628210/5107192
autocmd BufWritePost *.asciidoc,*.adoc :make
