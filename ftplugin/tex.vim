setlocal spell
set spelllang=en,es
" Add support for auto save
let g:auto_save = 1

" Only loads the custom snippets located in custom-snippets folder instead of
" the vim_snippets module snippets
let g:UltiSnipsSnippetDirectories=["custom-snippets"]

" Adding settings for deoplete and vimtex
" https://jdhao.github.io/2019/03/26/nvim_latex_write_preview/
" call deoplete#custom#var('omni', 'input_patterns', {
"           \ 'tex': g:vimtex#re#deoplete
"           \})
let g:coc_filetype_map = {'tex': 'latex'}

let b:ale_enabled = 0
let b:ale_linter_aliases = ['tex', 'text']
let g:vimtex_grammar_vlty = {'lt_command': 'languagetool'}
map <F9> :w<CR>:VimtexReload<CR>:compiler vlty<CR>:make<CR>:cwindow<CR><CR>

"let g:latex_view_general_options = shellescape('--synctex-forward "' . exepath(v:progpath) . ' --servername ' . v:servername . ' +{%lline} {%ffile}"')

"Zotero integration
" from https://retorque.re/zotero-better-bibtex/citing/cayw/
function! ZoteroCite()
  " pick a format based on the filetype (customize at will)
  let format = &filetype =~ '.*tex' ? 'cite' : 'pandoc'
  let api_call = 'http://127.0.0.1:23119/better-bibtex/cayw?format='.format.'&brackets=1'
  let ref = system('curl -s '.shellescape(api_call))
  return ref
endfunction

noremap <leader>z "=ZoteroCite()<CR>p
inoremap <C-z> <C-r>=ZoteroCite()<CR>

