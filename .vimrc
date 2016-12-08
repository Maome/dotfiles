" This must be first, because it changes other options as a side effect.
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Display
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set virtualedit=all
set cursorline
set rnu
set background=dark
set ruler		" show the cursor position all the time
set showmatch           " show matching (){}[], etc.
set hlsearch
syntax on

function TrailingWhiteSpace()
  highlight WhiteSpaceEOL term=reverse ctermbg=Magenta guibg=Magenta
  match WhiteSpaceEOL /\s\+$/
endfunction
au BufNewFile,BufReadPost,WinEnter * call TrailingWhiteSpace()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent		" always set autoindenting on
set bs=2
set backspace=indent,eol,start		" allow <- over everything in insert
filetype plugin indent on

autocmd FileType text setlocal textwidth=78
" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Preferences
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=50		" keep 50 lines of command line history
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Python Specifics
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pre-existing tab, for new tab use shiftwidth
au BufRead,BufNewFile *py,*pyw set tabstop=8
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile Makefile* set noexpandtab
" highlight bad whitespace red
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix
" For full syntax highlighting:
let python_highlight_all=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Status Line Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set laststatus=2

hi statusline ctermbg=59
