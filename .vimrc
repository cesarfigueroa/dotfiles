" Initialize
let mapleader = ","
call pathogen#infect()


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
set incsearch
set wildmenu
nnoremap <CR> :nohlsearch<CR>

" Indent
set autoindent
set smartindent
set softtabstop=2
set shiftwidth=2

if exists("&breakindent")
  set breakindent
  autocmd VimEnter,GUIEnter,BufNewFile,BufRead * set breakindentshift=2
  set breakindentshift=2
endif

" Backup
set backup
set backupdir=/tmp
set directory=/tmp

" Remove End of Line
autocmd BufWritePre * :set binary | set noeol
autocmd BufWritePost * :set nobinary | set eol

" Ruby
imap <c-l> <space>=><space>
autocmd Filetype ruby nnoremap <leader>r :!ruby %<CR>

" JavaScript
autocmd Filetype javascript nnoremap <leader>r :!jsc %<CR>

" Miscellaneous
set hidden
set nocompatible
set backspace=2
set spell
set autowrite
set clipboard=unnamed

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

