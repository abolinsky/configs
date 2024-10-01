" settings

syntax on			        " syntax highlighting
colorscheme onehalfdark " set colorscheme
filetype plugin on	  " enable loading plugin files, also switches on filetype detection
filetype indent on    " enable auto-indentation

set nocompatible		  " be iMproved, required
set number		    	  " set displayed numbers to be line numbers
set hidden		    	  " allow hidden buffers
set hlsearch	  		  " set highlight for last search pattern
set ignorecase        " ignore case in search
set incsearch         " show search results as you type
set wrap		      	  " set text to wraq
set autoindent			  " set auto indent on new line
set tabstop=4         " set tab width
set shiftwidth=4      " set shift width
set expandtab         " replace tabs with spaces
set noswapfile        " set no swap file for the buffer
set path+=~/.vimrc	  " add to path to be used by find, etc.
set spelllang=en_us   " set spellcheck language to english
set nrformats+=alpha  " allow us to increment/decrement alphabet characters
set autochdir         " set auto change current working directory


" internal variables

let mapleader=" "	          " set leader to space

" abbreviations

" abbreviating my name
iabbrev @n Alexander Bolinsky


" mappings

" remapping escape
inoremap kj <esc>

" move line down or up
nnoremap <C-j> :m .+1<CR>
nnoremap <C-k> :m .-2<CR>

" edit and source vimrc
nnoremap <leader>ev :tabedit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" surround word under cursor with quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" toggle spell checker
nnoremap <leader>sc :set spell!<CR>

" set path to include all files at or below the current directory and above until the src directory
nnoremap <leader>sp :set path=**;src<CR>

" Enable clipboard support
set clipboard=unnamedplus

" Use system clipboard for yanking and pasting
set clipboard+=unnamed

" fzf mappings
nnoremap <leader>s :Ag<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>gf :GFiles<CR>
nnoremap <leader>b :Buffers<CR>

" vimscript

" toggle relative number
function! ToggleRelativeNumber()
  set norelativenumber!
endfunction
nnoremap <leader>rn :call ToggleRelativeNumber()<CR>

" coc related
set signcolumn=yes

inoremap <silent><expr> <TAB>
     \ coc#pum#visible() ? coc#pum#next(1) :
     \ CheckBackspace() ? "\<Tab>" :
     \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                       \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
    let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" end coc related
augroup group_filetype
  autocmd!
  autocmd filetype python nnoremap <buffer> <localleader>c I#<esc>
  autocmd filetype cpp nnoremap <buffer> <localleader>c I//<esc>
  autocmd filetype cpp nnoremap <buffer> <localleader>so istd::cout << << std::endl;<esc>BBhi
  autocmd filetype cpp nnoremap <buffer> <localleader>se istd::cerr << << std::endl;<esc>BBhi
augroup END

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

autocmd BufWritePre *.cpp,*.h,*.hpp,*.cc,*.c ClangFormat

command! -nargs=0 ClangFormat execute ':%!clang-format'

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
