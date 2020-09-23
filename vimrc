
"Bundle NerdTree 
set rtp+=~/.vim/bundle/nerdtree 



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim default setting
set ts=2 sw=2
autocmd FileType python   set ts=2 sw=2 et
autocmd FileType ruby     set ts=2 sw=2 et
autocmd FileType vim      set ts=2 sw=2 et
autocmd FileType json     set ts=2 sw=2 et
autocmd FileType yaml     set ts=2 sw=2 et
autocmd FileType sql      set ts=2 sw=2 et
autocmd FileType markdown set ts=2 sw=2 et
autocmd FileType cpp      set ts=4 sw=4
autocmd FileType c        set ts=4 sw=4
autocmd FileType make     set ts=4 sw=4
set wrap
set novb
set backspace=indent,eol,start
set wmnu
set fencs=utf-8,cp949,cp932,euc-jp,shift-jis,big5,ucs-2le,latin1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctag file set
set tags+=./tags 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope settings 
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb

if filereadable("./cscope.out")
  cs add cscope.out
else
  cs add /usr/src/linux/cscope.out
endif

set csverb

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin
"set nocompatible
filetype off                  " required
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'The-NERD-tree'
Plugin 'scrooloose/nerdtree'
Plugin 'AutoComplPop'
Plugin 'taglist-plus'
Plugin 'ayu-theme/ayu-vim' " or other package manager
Plugin 'Shougo/deoplete.nvim'
"Plugin 'https://github.com/kien/ctrlp.vim'
"Plugin 'vim-scripts/Conque-GDB'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'https://github.com/sjl/splice.vim'

" git plugin
Plugin 'airblade/vim-gitgutter'

" indent guide plugin
Plugin 'nathanaelkane/vim-indent-guides'

" let Vundle manage Vundle, required
"
" " Keep Plugin commands between vundle#begin/end.
"
" " vim-airline
 Plugin 'vim-airline/vim-airline'
 Plugin 'vim-airline/vim-airline-themes'
call vundle#end()
filetype plugin indent on    " required



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""         NERDTree Settings

""
" NERD Tree를 왼쪽에 생성
let NERDTreeWinPos = "left"
filetype on

" Tag list가 사용하는 ctags의 경로 설정
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Inc_Winwidth = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_Auto_Open = 0

" Tag list 창을 오른쪽으로 생성
let Tlist_Use_Right_Window = 1

" Custom Settings
let mapleader=","

" Custom Settings
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Map Setting 
nnoremap <C-F> :NERDTreeFind<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>rc :rightbelow vnew ~/.vimrc<CR>
map <F1> :!ctags -R ./ <CR><CR> :!mkcscope.sh <CR><CR>
map <F2> :w <CR>
map <F3> v]}zf  " fold
map <F4> zo     " close fold
map <F5> :w<CR> :make clean; make<CR>
map <F6> :cn<CR>
map <F7> :cp<CR>
map <F8> :cclose<CR>                " close build result output window
map <F9> [i                    "
map <F10> ''                   " go definition (?)
map <F11> ^]                   " go tag
map <F12> ^T                   " back tag

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
	" For no inserting <CR> key.
	"return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"
" Syntax Highlighting
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent Setting 
set autoindent      " Smart indent 
set smartindent     " 자동 들여쓰기 
set cindent         " C 프로그래밍용 자동 들여쓰기
set hlsearch        " 검색어 강조 
set ignorecase      " 검색 시 대소문자 무시
set expandtab       " 탭 대신 스페이스
set tabstop=4       " 탭 4칸
set shiftwidth=4    " 자동 들여쓰기 4칸
"
" 하이라이트 설정 
highlight Comment term=bold cterm=bold ctermfg=4
highlight String ctermfg=6
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" putty에서도 Vim 테마 설정

if &term =~ "xterm"
    "256 color --
    let &t_Co=256
    " restore screen after quitting
    set t_ti=ESC7ESC[rESC[?47h t_te=ESC[?47lESC8
    if has("terminfo")
        let &t_Sf="\ESC[3%p1%dm"
        let &t_Sb="\ESC[4%p1%dm"
    else
        let &t_Sf="\ESC[3%dm"
        let &t_Sb="\ESC[4%dm"
    endif
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""use VIM Airline"
" for vim-airline
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='hybrid'
set laststatus=2 " turn on bottom bar

let g:indentLine_char = ''
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

colorscheme molokai
"colorscheme gruvbox
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim-airline setting
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='luna'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-indent-guides setting
let g:indent_guides_enable_on_vim_startup = 1 
let g:indent_guides_auto_colors = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Deoplete
"let g:deoplete#enable_at_startup = 1

" clang_complete
set completeopt-=preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


