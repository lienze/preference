"""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'taglist.vim'
Plugin 'itchyny/vim-cursorword'
" Plugin 'vim-airline/vim-airline'
" Plugin 'autoload_cscope.vim'
" Plugin 'fatih/vim-go'
" Plugin 'SirVer/ultisnips'    " if note UltiSnips requires py >= 2.7 or py3, apt install vim-gtk
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'ycm-core/YouCompleteMe'
call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""
" base setting
""""""""""""""""""""""""""""""""""""""""""""
syntax on
set nu
set smartindent
set shiftwidth=4
set tabstop=4
set hlsearch

""""""""""""""""""""""""""""""""""""""""""""
" extra setting
""""""""""""""""""""""""""""""""""""""""""""
set nocompatible	" Use Vim defaults (much better!)
""set bs=indent,eol,start		" allow backspacing over everything in insert mode
set bs=2
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
"set tags=tags;
"set autochdir
""""""""""""""""""""""""""""""""""""""""""""
" key mapping
""""""""""""""""""""""""""""""""""""""""""""
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap < <><ESC>i
inoremap { {}<ESC>i
inoremap <CR> <c-r>=EnterButton()<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap > <c-r>=ClosePair('>')<CR>
inoremap " <c-r>=DealSemicolon('"')<CR>
inoremap ' <c-r>=DealSemicolon("'")<CR>
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction
function! DealSemicolon(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char.a:char."\<Left>"
	endif
endfunction
function! EnterButton()
	let curChar = getline('.')[col('.')-1]
	if (curChar == '}')
		return "\<CR>\<ESC>xO"
	elseif (curChar == ')')
		return "\<CR>\<ESC>O\<Tab>"
	else
		return "\<CR>"
	endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""
" Tag List
""""""""""""""""""""""""""""""""""""""""""""
map <F1> <ESC>:TlistToggle<CR>
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 0
let Tlist_Auto_Open = 0
let Tlist_Close_On_Select = 1

""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""
map <F2> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1    "Show Hidden files
let NERDTreeIgnore = ['\.swp','\.swo']    "Don't Show Files
let NERDTreeQuitOnOpen = 1    "Close NERDTree when files was opened
let NERDTreeWinPos = 0    "Show on left by default
let NERDTreeShowBookmarks = 1    "Show BookMarks

"""""""""""""""""""""""""""""""""""""""""""""
" show blank space
"""""""""""""""""""""""""""""""""""""""""""""
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list

"""""""""""""""""""""""""""""""""""""""""""""
" auto load cscope.out
"""""""""""""""""""""""""""""""""""""""""""""
if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add $PWD/cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

"""""""""""""""""""""""""""""""""""""""""""""
" code setting
"""""""""""""""""""""""""""""""""""""""""""""
"if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
"   set fileencodings=ucs-bom,utf-8,latin1
"endif

"""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe config
"""""""""""""""""""""""""""""""""""""""""""""
set completeopt=longest,menu    " same behavior with normal IDE
autocmd InsertLeave * if pumvisible() == 0|pclose|endif    " leave insert mode and close the preview window
let g:ycm_complete_in_comments = 1    " Complete in comments
let g:ycm_complete_in_strings = 1     " Complete in strings
let g:ycm_filetype_whitelist = {
			\ "go":1,
			\ "c":1,
			\ "cpp":1,
			\ "h":1,
			\ }
