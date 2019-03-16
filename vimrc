let mapleader=";"
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set encoding=utf-8
set termencoding=utf-8
filetype on
set incsearch
set ignorecase
set wildmenu
set laststatus=2
set gcr=a:block-blinkon0
set cursorline
set hlsearch
set nocompatible
set wrap
let $VIMFILES = $HOME
set undofile
set undodir=$VIMFILES/.undodir
let g:Powerline_colorscheme='solarized256'
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'fancy'
let Powerline_symbols='compatible'
syntax enable
syntax on
filetype indent on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set nu
let g:indent_guides_start_level=2
set nofoldenable
set backspace=indent,eol,start
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'vim-airline/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdcommenter' "快速注释插件
Plugin 'majutsushi/tagbar' "taglist替代品
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tenfyzhong/CompleteParameter.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Yggdroot/Leader'
call vundle#end()
filetype plugin indent on
let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' 
let g:ycm_collect_identifiers_from_tags_files = 1
set completeopt-=preview
let g:ycm_confirm_extra_conf=0
let g:ycm_cache_omnifunc=0
let g:ycm_complete_in_comments=1
let g:ycm_use_ultisnips_completer=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0

au BufWrite *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx :Autoformat

let g:go_fmt_command = "goimports"
let g:golang_onwrite = 0
let g:golang_inline_highlight = 0
let g:golang_cwindow = 0

let &colorcolumn="100"
highlight CursorLine cterm=NONE ctermbg=DarkGrey ctermfg=NONE guibg=NONE guifg=NONE

if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \ exe "normal g'\"" |
    \ endif
endif

map <F4> :TagbarToggle<CR>
map <F5> :NERDTreeToggle<CR>
let g:tagbar_type_cpp = {
            \ 'kinds' : [
            \ 'd:macros:1',
            \ 'g:enums',
            \ 't:typedefs:0:0',
            \ 'e:enumerators:0:0',
            \ 'n:namespaces',
            \ 'c:classes',
            \ 's:structs',
            \ 'u:unions',
            \ 'f:functions',
            \ 'm:members:0:0',
            \ 'v:global:0:0',
            \ 'x:external:0:0',
            \ 'l:local:0:0'
            \ ],
            \ 'sro'        : '::',
            \ 'kind2scope' : {
            \ 'g' : 'enum',
            \ 'n' : 'namespace',
            \ 'c' : 'class',
            \ 's' : 'struct',
            \ 'u' : 'union'
            \ },
            \ 'scope2kind' : {
            \ 'enum'      : 'g',
            \ 'namespace' : 'n',
            \ 'class'     : 'c',
            \ 'struct'    : 's',
            \ 'union'     : 'u'
            \ },
            \ }
let NERDTreeMinimalUI=0
"let NERDTreeWinPos="right"
let NERDTreeQuitOnOpen=1
"只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1

