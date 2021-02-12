set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/extended.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => My Configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8
set fileencoding=utf-8

" Use Unix as the standard file type
set fileformats=unix,dos,mac

try
    syntax on

    " Colorscheme
    set background=dark
    colorscheme peaksea

    set showcmd
    set cursorline
    set cursorcolumn
catch
endtry

let g:NERDTreeWinPos = 'left'
map <leader>BE :BufExplorer<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Statusline Customizations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set laststatus=2  "Show Statusline
    set showtabline=2 "Show tabline
    set guioptions+=e "use GUI tabline
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
      \   'fugitive': '%{exists("*FugitiveHead")?MyFugitive:""}'
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
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \   'fugitive': 'MyFugitive'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '|' }
      \ }
 
let g:lightline.tabline = {
      \ 'left': [ [ 'tabs' ] ],
      \ 'right': [ [ 'close' ] ]
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Configuring Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    let g:syntastic_stl_format = '[%E{Err: #%e}%B{ | }%W{Warn: #%w}]'
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 0
    let g:syntastic_aggregate_errors = 1
    let g:syntastic_check_on_wq = 0
    
    let g:syntastic_style_error_symbol = '⚡'
    let g:syntastic_error_symbol = '❌'
    let g:syntastic_style_warning_symbol = '❗'
    let g:syntastic_warning_symbol = '❗'
    let g:syntastic_javascript_checkers = ['jsxcs', 'jsxhint']
    let g:syntastic_python_checkers = ['pylint']
    let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
    let g:syntastic_c_checkers = ['cpplint']
    let g:syntastic_cpp_checkers = ['cpplint']
    let g:syntastic_enable_perl_checker = 1
    let g:syntastic_vim_checkers = ['vint']
    let g:syntastic_sh_checkers = ['shellcheck', 'sh']
    let g:syntastic_yaml_checkers = ['yamllint']
"    let g:syntastic_json_checkers = ['jsonlint', 'jsonval'] 
    map <leader>sc :SyntasticCheck<cr>
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YAML Section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType yaml setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => JSON Formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! FormatJSON()
    :%!python3 -m json.tool
endfunction
 
function! RawJSON()
    :%delete | 0put =json_encode(json_decode(@@))
    ":%!jq -c .
endfunction
 
augroup json_ft
    autocmd BufNewFile,BufRead *.ndjson set filetype=json
    autocmd FileType json nmap <Leader>jsp :call FormatJSON()<cr>
    autocmd FileType json nmap <Leader>jsr :call RawJSON()<cr>
    autocmd FileType json setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
augroup END
 
command! -range JSONRaw <line1>,<line2>call RawJSON()
command! -range JSONFormat <line1>,<line2>call FormatJSON()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Logstash Config Formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType logstash setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => DevIcons
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    " Linux Fonts
    " set guifont=DroidSansMono\ Nerd\ Font\ 11
    " MacOS Fonts
    " set guifont=DroidSansMono_Nerd_Font:h11
 
    " loading the plugin
    let g:webdevicons_enable = 1
    " adding the flags to NERDTree
    let g:webdevicons_enable_nerdtree = 1
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SnipMate and Completion Menu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:snipMate = { 'snippet_version' : 1 }

set omnifunc=syntaxcomplete#Complete
set complete+=kspell
set completeopt=longest,menuone

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! MyFugitive()
  return winwidth(0) > 70 ? (strlen(FugitiveHead()) ? FugitiveHead().' '.'' : '') : ''
endfunction

