" Initialize
set nocompatible

syntax enable
colorscheme solarized
set background=dark
filetype plugin indent on
set encoding=utf-8
let mapleader = ","
call pathogen#infect()

" =================================== General ==================================

set autowrite
set backspace=indent,eol,start
set clipboard=unnamed
set hidden
set history=100
set spell

" Search
set hlsearch
set ignorecase smartcase
set incsearch
set wildmenu
nnoremap <CR> :nohlsearch<CR>
highlight Search ctermfg=7 ctermbg=none cterm=underline

" Backup
set backup
set backupdir=/tmp
set directory=/tmp

" =================================== Visual ===================================

set cursorline
set number
set showcmd
set t_Co=256

" Status Line
set laststatus=2
set statusline=\ %F\ %m
highlight StatusLine ctermbg=0 ctermfg=14

" Line Wrapping
set linebreak
set wrap

" Indentation
set autoindent
set expandtab
set listchars=eol:¬
nnoremap <leader>l :set list!<CR>
set shiftwidth=2
set smartindent
set softtabstop=2
autocmd BufRead,BufWrite *.gitconfig :set noexpandtab | set shiftwidth=8 | set softtabstop=0

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

" =============================== Abbreviations ================================

iabbrev lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum

" ============================= Language Specific ==============================

" HTML
augroup html
  autocmd!
  autocmd FileType html nnoremap <leader>r :silent !open -a Safari %<CR>:redraw!<CR>
  autocmd FileType html setlocal commentstring=<!--\ %s\ -->
augroup END

" JavaScript
augroup javascript
  autocmd!
  autocmd FileType javascript nnoremap <leader>r :!jsc %<CR>
  autocmd FileType javascript setlocal commentstring=//\ %s
augroup END

" Ruby
inoremap <c-l> <space>=><space>
augroup ruby
  autocmd!
  autocmd FileType ruby nnoremap <leader>r :!ruby %<CR>
  autocmd FileType ruby setlocal commentstring=#\ %s
augroup END

" VimL
augroup vim
  autocmd!
  autocmd FileType vim setlocal commentstring=\"\ %s
augroup END

" =============================== Miscellaneous ================================

augroup miscellaneous
  autocmd!

  " Jump to last cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  " Always switch to current file directory
  autocmd BufEnter *
    \ if bufname("") !~ "^\[A-Za-z0-9\]*://" |
    \   lcd %:p:h |
    \ endif
augroup END

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
