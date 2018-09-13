set number
set ruler
highlight ColorColumn ctermbg=16
set colorcolumn=80

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
 
" Enable syntax highlighting
syntax on

" Diisable arrow keys until a wean myself off them
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Use visual bell instead of beeping when doing something wrong
set visualbell
" Highlight all matches whilst searching
set hlsearch
" Use Linux coding styles preferred indent size
set tabstop=8

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
    autocmd BufNewFile *.c 0r ~/.vim/templates/skeleton.c
  augroup END
endif
