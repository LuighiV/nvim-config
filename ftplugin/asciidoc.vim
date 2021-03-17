setlocal spell
set spelllang=en_us,es
" Add support for auto save
let g:auto_save = 1

if !exists("g:vim_asciidoc_preview_enable")
  let g:vim_asciidoc_preview_enable = 0
endif
" Autocompile on save based on
" https://github.com/JamshedVesuna/vim-markdown-preview/blob/master/plugin/vim-markdown-preview.vim
"https://stackoverflow.com/a/4628210/5107192
if g:vim_asciidoc_preview_enable == 1
	autocmd BufWritePost *.asciidoc,*.adoc :make
endif

noremap <Leader>p :make<CR><CR>
