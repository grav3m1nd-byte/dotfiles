set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/extended.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim

" execute pathogen#infect()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => My Configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8
set fileencoding=utf-8
" Use Unix as the standard file type
set ffs=unix,dos,mac

try
    syntax on
    colorscheme peaksea
    set showcmd
    set cursorline
catch
endtry

let g:NERDTreeWinPos = "left"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Statusline Customizations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set laststatus=2
"     set statusline=\ %{HasPaste()}%F%m%r%h
"     set statusline+=\ %w
"     set statusline+=\ \ CWD:\ %r%{getcwd()}%h
"     set statusline+=\ Line:\ %l
"     set statusline+=\ \ Column:\ %c
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline: my own customizations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help" && &readonly)',
      \   'modified': '(&filetype!="help" && (&modified || !&modifiable))',
      \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'separator': { 'left': '', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': '|' }
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Configuring Jedi-Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:jedi#auto_initialization = 1
" let g:jedi#auto_vim_configuration = 1
" let g:jedi#use_splits_not_buffers = "right"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Configuring Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
"    set statusline+=%#warningmsg#
"    set statusline+=%{SyntasticStatuslineFlag()}
"    set statusline+=%*

    let g:syntastic_stl_format = "[%E{Err: #%e}%B{ | }%W{Warn: #%w}]"
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 0
    let g:syntastic_aggregate_errors = 1
    let g:syntastic_check_on_wq = 0
    
    let g:syntastic_style_error_symbol = '⚡'
    let g:syntastic_error_symbol = '✗'
    let g:syntastic_warning_symbol = '⚠'
    let g:syntastic_javascript_checkers = ['jsxcs', 'jsxhint']
    let g:syntastic_python_checkers = ['pylint']
    let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
    let g:syntastic_enable_perl_checker = 1
    let g:syntastic_vim_checkers = ['vint']
    let g:syntastic_sh_checkers = ['shellcheck', 'sh']
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => DevIcons
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linux Fonts
" set guifont=DroidSansMono\ Nerd\ Font\ 11
" MacOS Fonts
" set guifont=DroidSansMono\ Nerd\ Font:h11

" loading the plugin
let g:webdevicons_enable = 0
" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 0

