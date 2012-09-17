" Initialize
colorscheme solarized
set background=dark
filetype plugin indent on
set encoding=utf-8
let mapleader = ","
call pathogen#infect()

" General
set hidden
set nocompatible
set backspace=indent,eol,start
set spell
set autowrite
set backspace=indent,eol,start
set clipboard=unnamed
set history=100

" Visual
syntax enable
colorscheme Tomorrow-Night
set t_Co=256
set number
set showcmd
highlight LineNr ctermfg=236
highlight Search ctermfg=15 ctermbg=NONE cterm=underline

" Line Wrapping
set wrap
set linebreak

" Search
set hlsearch
set ignorecase smartcase
set incsearch
set wildmenu
nnoremap <CR> :nohlsearch<CR>

" Indent
set autoindent
set smartindent
set softtabstop=2
set shiftwidth=2


" Backup
set backup
set backupdir=/tmp
set directory=/tmp

set cursorline
set statusline=\ %F\ %m
highlight StatusLine ctermfg=14 ctermbg=0

" ================================= Navigation =================================

set scrolloff=3

" Force hjkl
noremap <Up> <nop>
noremap <Left> <nop>
noremap <Down> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Left> <nop>
inoremap <Down> <nop>
inoremap <Right> <nop>

" Create splits with hjkl
nnoremap <leader>swk :topleft new<CR>
nnoremap <leader>swl :botright vnew<CR>
nnoremap <leader>swj :botright new<CR>
nnoremap <leader>swh :topleft vnew<CR>

nnoremap <leader>sbk :leftabove new<CR>
nnoremap <leader>sbl :leftabove vnew<CR>
nnoremap <leader>sbj :rightbelow new<CR>
nnoremap <leader>sbh :rightbelow vnew<CR>

" Move around splits with <c-hjkl>
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-l> <c-w>l

" Ruby
imap <c-l> <space>=><space>
autocmd Filetype ruby nnoremap <leader>r :!ruby %<CR>
" =============================== Abbreviations ================================

iabbrev lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum


" JavaScript
autocmd Filetype javascript nnoremap <leader>r :!jsc %<CR>


" Show syntax highlighting groups for word under cursor
nmap <leader>g :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Jump to last cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New File Name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
nnoremap <leader>n :call RenameFile()<CR>