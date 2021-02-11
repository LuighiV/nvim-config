set number 
set mouse=a
set numberwidth=1
set clipboard=unnamedplus
syntax enable
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2

" Add a text limiter
set wrap
set textwidth=79

" Default 4000ms for async is not good
"set updatetime=100

call plug#begin('~/.vim/plugged')

" Themes
Plug 'morhetz/gruvbox'

" IDE
Plug 'easymotion/vim-easymotion'
" Adding support for nerdtree plugin
Plug 'scrooloose/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
" Adding support for SASS
Plug 'cakebaker/scss-syntax.vim'
" Adding support for tex
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
" From https://github.com/ycm-core/YouCompleteMe/issues/1751#issuecomment-273380629
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" Employing deoplete for auto completing
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
" Adding support for linter ALE
Plug 'dense-analysis/ale'
" Adding git Support
Plug 'tpope/vim-fugitive'
" Add git difference markers
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

"Adding autosave capabilities
Plug '907th/vim-auto-save'
"Syntax highlighting
Plug 'sheerun/vim-polyglot'
call plug#end()

colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

let mapleader=" "
let maplocalleader = "\\"

" Adding settings for LaTeX
" Thanks to https://castel.dev/post/lecture-notes-1/
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" Adding settings for UtilSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
" Adding settings for python3
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" Enabling deoplete at the begining
let g:deoplete#enable_at_startup = 1

" Adding settings for YouCompleteMe
" From https://samsudar.com/code/vim_and_latex/
" Turn off YCM
" nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>
" Turn on YCM
" nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR>

"if !exists('g:ycm_semantic_triggers')
"  let g:ycm_semantic_triggers = {}
"endif
"au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

" Use ALE as completion sources for all code.
""call deoplete#custom#option('sources', {
""\ '_': ['ale'],
""\})

" Adding custom deoplete mappings
" https://github.com/Shougo/deoplete.nvim/issues/194#issuecomment-190233671
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<Up>"

"Adding autosave capabilities
let g:auto_save_events = ["InsertLeave", "TextChanged"]   

" Fix files automatically on save
let g:ale_fix_on_save = 1

nmap <F6> <Plug>(ale_fix)

let g:ale_hover_cursor=1
if has('nvim')
  let g:ale_floating_preview=1
  let g:ale_hover_to_floating_preview=1
  let g:ale_detail_to_floating_preview=1
else
  let g:ale_set_balloons=1
endif
let g:ale_cursor_detail=1

nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

" Adding a tool to write quickly html tags
" From: https://coderwall.com/p/1omscg/vim-easy-insert-html-tags 
imap <C-t> <></><Esc>5hdiwp3lpT>i

" Mapping to autoclose delimiters
" from https://medium.com/vim-drops/custom-autoclose-mappings-1ff90f45c6f5
"-- AUTOCLOSE --
"autoclose and position cursor to write text inside
inoremap ' ''<left>
inoremap ` ``<left>
inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
"autoclose with ; and position cursor to write text inside
inoremap '; '';<left><left>
inoremap `; ``;<left><left>
inoremap "; "";<left><left>
inoremap (; ();<left><left>
inoremap [; [];<left><left>
inoremap {; {};<left><left>
"autoclose with , and position cursor to write text inside
inoremap ', '',<left><left>
inoremap `, ``,<left><left>
inoremap ", "",<left><left>
inoremap (, (),<left><left>
inoremap [, [],<left><left>
inoremap {, {},<left><left>
"autoclose and position cursor after
inoremap '<tab> ''
inoremap `<tab> ``
inoremap "<tab> ""
inoremap (<tab> ()
inoremap [<tab> []
inoremap {<tab> {}
"autoclose with ; and position cursor after
inoremap ';<tab> '';
inoremap `;<tab> ``;
inoremap ";<tab> "";
inoremap (;<tab> ();
inoremap [;<tab> [];
inoremap {;<tab> {};
"autoclose with , and position cursor after
inoremap ',<tab> '',
inoremap `,<tab> ``,
inoremap ",<tab> "",
inoremap (,<tab> (),
inoremap [,<tab> [],
inoremap {,<tab> {},
"autoclose 2 lines below and position cursor in the middle 
inoremap '<CR> '<CR>'<ESC>O
inoremap `<CR> `<CR>`<ESC>O
inoremap "<CR> "<CR>"<ESC>O
inoremap (<CR> (<CR>)<ESC>O
inoremap [<CR> [<CR>]<ESC>O
inoremap {<CR> {<CR>}<ESC>O
"autoclose 2 lines below adding ; and position cursor in the middle 
inoremap ';<CR> '<CR>';<ESC>O
inoremap `;<CR> `<CR>`;<ESC>O
inoremap ";<CR> "<CR>";<ESC>O
inoremap (;<CR> (<CR>);<ESC>O
inoremap [;<CR> [<CR>];<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
"autoclose 2 lines below adding , and position cursor in the middle 
inoremap ',<CR> '<CR>',<ESC>O
inoremap `,<CR> `<CR>`,<ESC>O
inoremap ",<CR> "<CR>",<ESC>O
inoremap (,<CR> (<CR>),<ESC>O
inoremap [,<CR> [<CR>],<ESC>O
inoremap {,<CR> {<CR>},<ESC>O
