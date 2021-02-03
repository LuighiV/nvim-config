setlocal spell
set spelllang=en_us,es
" Add support for auto save
let g:auto_save = 1

" Only loads the custom snippets located in custom-snippets folder instead of
" the vim_snippets module snippets
let g:UltiSnipsSnippetDirectories=["custom-snippets"]
