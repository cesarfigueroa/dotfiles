" Initialize
set nocompatible

syntax enable
colorscheme Tomorrow-Night
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
set nospell
set exrc
set nosecure
set lazyredraw

" Search
set hlsearch
set ignorecase smartcase
set incsearch
set wildmenu
nnoremap <CR> :nohlsearch<CR>

" Backup
set backup
set backupdir=/tmp
set directory=/tmp

" Whitespace
autocmd BufWritePre * :%s/\s\+$//e

" =================================== Visual ===================================

set cursorline
set number
set showcmd
set t_Co=256

" Status Line
set laststatus=2
set statusline=\ %F\ %m

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

" Highlights
highlight Cursor ctermfg=13
highlight ErrorMsg ctermbg=7
highlight Search ctermfg=7 ctermbg=none cterm=underline
highlight StatusLine ctermbg=0 ctermfg=14
highlight Visual ctermbg=8 ctermfg=7

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
nnoremap <leader>sbl :rightbelow vnew<CR>
nnoremap <leader>sbj :rightbelow new<CR>
nnoremap <leader>sbh :leftabove vnew<CR>

" Move around splits with <[ctrl] + hjkl>
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-l> <c-w>l

" =============================== Abbreviations ================================

iabbrev lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum

" ============================= Language Specific ==============================

inoremap <c-l> <space>=><space>

augroup languages
  autocmd!

" HTML
  autocmd FileType html nnoremap <leader>r :silent !open -a Safari %<CR>:redraw!<CR>
  autocmd FileType html setlocal commentstring=<!--\ %s\ -->
  autocmd FileType html inoremap <leader>/ </<C-X><C-O>

" JavaScript
  autocmd FileType javascript nnoremap <leader>r :!jsc %<CR>
  autocmd FileType javascript setlocal commentstring=//\ %s

" Ruby
  autocmd FileType ruby nnoremap <leader>r :!ruby %<CR>
  autocmd FileType ruby setlocal commentstring=#\ %s

" VimL
  autocmd FileType vim setlocal commentstring=\"\ %s

" Python
  autocmd FileType python nnoremap <leader>r :!python %<CR>
  autocmd FileType python :set shiftwidth=4 | set softtabstop=4

" Shell
  autocmd FileType sh nnoremap <leader>r :! sh %<CR>

" gitconfig
  autocmd FileType gitconfig :set shiftwidth=8 | set softtabstop=8

" Cucumber
  autocmd FileType cucumber nnoremap <leader>r :! cucumber %<CR>

" RSpec
  autocmd BufRead,BufNewFile *_spec.rb nnoremap <leader>r :! rspec %<CR>

" Slim
  autocmd BufRead,BufNewFile *.slim :set filetype=slim
  autocmd FileType slim setlocal commentstring=\/\ %s

" Handlebars
  autocmd BufRead,BufNewFile *.handlebars :set filetype=html
augroup END

" =================================== CTRL-P ===================================

function! SetLastStatus(number)
  execute 'set laststatus='.number
endfunction

let g:ctrlp_status_func = {
  \ 'enter': 'SetLastStatus(0)',
  \ 'exit': 'SetLastStatus(2)'
\ }

let g:ctrlp_max_files=0

set wildignore+=node_modules/*,tmp/*,vendor/*,_site/*
set wildignore+=*.db,*.log
set wildignore+=*.otf,*.ttf,*.woff
set wildignore+=*.gif,*.jpg,*.png

" =============================== Miscellaneous ================================

augroup miscellaneous
  autocmd!

  " Jump to last cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
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
