set nocompatible
set t_Co=256
colorscheme onehalfdark
set relativenumber

" Indentations
" set paste
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set copyindent
set smartindent
set cindent
set expandtab
set autoindent

" Status Line Setup
set laststatus=2
set statusline=
set statusline+=\ %.40F\ %Y[%M]\ %R
set statusline+=%=
set statusline+=\ ascii:\ %b\ hex:\ %B\ row:\ %l/%L\ col:\ %c\ percent:\ %p%%

" Color Syntax
syntax on

set hlsearch

" Backspace to delete a Character
set backspace=indent,eol,start
nnoremap <BS> X

set ruler

" Highlight the Current Line
set cursorline
hi CursorLine gui=underline cterm=underline

" Highlight Current Line Number
hi CursorLineNr cterm=bold ctermfg=YELLOW

" Highlight Status Line Window Wise
highlight StatusLine ctermfg=BLACK ctermbg=GREEN cterm=NONE
highlight StatusLineNC ctermfg=BLACK ctermbg=DARKGREY cterm=NONE

" Visual Bell
set vb t_vb=

" Access System Clipboard
set clipboard+=unnamed

" set go+a

" Copy
map <C-c> "+yy

" Cut
map <C-x> "+dd

map <silent> <CR> :noh<CR>

" Command History
set history=10000

set wildmenu
" set wildmenu=list
set wildignore=*.docx,*.class,*.pdf,*.exe,*.ctxt,*.exe

" Default Splitting
set splitright
set splitbelow

filetype on
filetype plugin indent on

autocmd BufWritePre,BufRead *.html,*.js,*.java,*.c,*.py,*.json :normal gg=G
" nnoremap iS `[v`]

" Type jj to exit insert mode quickly
inoremap jj <Esc>

inoremap =G <Esc> =G i
" My code for commenting and uncommenting

" 1st Method only C & Java Specific
" map <silent> <C-/> :s:\(^\s*\)\(.\):\1\/\/ \2<CR><CR>
" map <silent> <C-?> :s:\(^\s*\)\/\/ *:\1<CR>

" 2nd Method different file types
" let g:commentchar = {"c": "//", "java": "//", "python": "#", "vim":"\""} 
" let g:comment = commentchar[&ft]

" let cmd = ":s:\\(^\\s*\\)\\(.\\):\\1". comment. " \\2"
" map <silent> <C-/> :execute cmd<CR><CR>

" map <silent> <C-/> :execute 's:\(^ *\)\(.\):\1'.commentchar[&ft].' \2'<CR><CR>
" map <silent> <C-?> :execute ':s:\(^\s*\)'.commentchar[&ft].' *:\1'<CR>

" Commenting blocks of code.
augroup commenting_blocks_of_code
  autocmd!
  autocmd FileType c,cpp,java,scala let b:comment_character = '//'
  autocmd FileType sh,ruby,python   let b:comment_character = '#'
  autocmd FileType conf,fstab       let b:comment_character = '#'
  autocmd FileType tex              let b:comment_character = '%'
  autocmd FileType mail             let b:comment_character = '>'
  autocmd FileType vim              let b:comment_character = '"'
  autocmd FileType text             let b:comment_character = '--'
augroup END

noremap <silent> <C-/> :<C-B>silent <C-E>s/\(^\s*\)\(.\)/\1<C-R>=escape(b:comment_character,'\/')<CR> \2/<CR>:nohlsearch<CR>
noremap <silent> <C-?> :<C-B>silent <C-E>s/\(^\s*\)<C-R>=escape(b:comment_character,'\/')<CR>\s*/\1/e<CR>:nohlsearch<CR>

inoremap <silent> <C-/> <ESC>:<C-B>silent <C-E>s/\(^\s*\)\(.\)/\1<C-R>=escape(b:comment_character,'\/')<CR> \2/<CR>:nohlsearch<CR>A
inoremap <silent> <C-?> <ESC>:<C-B>silent <C-E>s/\(^\s*\)<C-R>=escape(b:comment_character,'\/')<CR>\s*/\1/e<CR>:nohlsearch<CR>A

" Running a program from inside vim

" nnoremap <C-K> :w <CR>:!cls <CR>:!javac % <CR>:!java %<CR>
" nnoremap <F8> :w <CR>:!cls <CR>:!gcc % && .\a.exe<CR>
" nnoremap <C-K> :w <CR>:!cls <CR>:!javac %<CR>
" nnoremap <F9>  :w <CR>:!cls <CR>:!java %< <CR>
" nnoremap <C-;> :w <CR>:!cls <CR>:!python %<CR>

" Running programs within vim in Insert Mode
autocmd FileType c imap <S-F9> <ESC> :w <CR>:!cls <CR>:!gcc % -o %:t:r && %:t:r.exe <CR>
autocmd FileType java imap <S-F9> <ESC> :w <CR>:!cls <CR>:!javac % && java %:t:r <CR>
autocmd FileType python imap <S-F9> <ESC> :w <CR>:!cls <CR>:!python %<CR>

" Running programs within vim in Normal Mode
autocmd FileType c map <S-F9> <ESC> :w <CR>:!cls <CR>:!gcc % -o %:t:r && %:t:r.exe <CR>
autocmd FileType java map <S-F9> <ESC> :w <CR>:!cls <CR>:!javac % && java %:t:r <CR>
autocmd FileType python map <S-F9> <ESC> :w <CR>:!cls <CR>:!python %<CR>

" Fixing netrw buffer problem
autocmd FileType netrw setl bufhidden=delete " Or we can use qa!

" Searching in sub-directories with find command
set path+=**
