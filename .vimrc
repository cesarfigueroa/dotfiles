" Visual
syntax enable
colorscheme Tomorrow-Night
highlight LineNr ctermfg=236
set t_Co=256
set number
set showcmd

" Line Wrapping
set wrap
set linebreak

" Search
set hlsearch
set incsearch
set wildmenu

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

" Miscellaneous
set hidden
set nocompatible
set backspace=2
set spell
set autowrite
set clipboard=unnamed

" Mappings
imap <c-l> <space>=><space>

let mapleader = ","
autocmd Filetype ruby nnoremap <leader>r :!ruby %<CR>
autocmd Filetype javascript nnoremap <leader>r :!jsc %<CR>

" Show syntax highlighting groups for word under cursor
nmap <leader>g :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

call pathogen#infect()