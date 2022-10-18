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
set tabstop=2         " set tab width
set shiftwidth=2      " set shift width
set expandtab         " replace tabs with spaces
set noswapfile        " set no swap file for the buffer
set path+=~/.vimrc	  " add to path to be used by find, etc.
set spelllang=en_us   " set spellcheck language to english
set nrformats+=alpha  " allow us to increment/decrement alphabet characters
set autochdir         " set auto change current working directory


" internal variables

let mapleader=" "	          " set leader to space
let maplocalleader=","      " set local leader to comma

let g:netrw_liststyle=3	    " set default netrw listing style as tree
let g:netrw_banner=0		    " set default netrw banner visibility off
let g:netrw_browse_split=4	" set default file open behavior: 0 (same window), 1 (new h split), 2 (new v split), 3 (new tab), 4 (previous window)
let g:netrw_winsize=25	    " set default netrw window size to 25%
let g:netrw_altv=1		      " set default left-right split to right


" abbreviations

" abbreviating my name
iabbrev @n Alexander Bolinsky


" mappings

" remapping escape
inoremap kj <esc>
inoremap <esc> <nop>

" move line down or up
nnoremap <C-j> :m .+1<CR>
nnoremap <C-k> :m .-2<CR>

" toggle netrw
nnoremap <Leader>ew :Lexplore<CR>
nnoremap <leader>ee :Lexplore %:p:h<CR>
tnoremap <Leader>ew <C-w>N :Lexplore<CR> i<CR>
tnoremap <Leader>ee <C-w>N :Lexplore %:p:h<CR> i<CR>

" edit and source vimrc
nnoremap <leader>ev :tabedit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" surround word under cursor with quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" toggle spell checker
nnoremap <leader>sc :set spell!<CR>

" set path to include all files at or below the current directory and above until the src directory
nnoremap <leader>sp :set path=**;src<CR>

" set colorscheme
nnoremap <leader>csl :colorscheme onehalflight<CR>
nnoremap <leader>csd :colorscheme onehalfdark<CR>


" vimscript

" toggle relative number
function! ToggleRelativeNumber()
  set norelativenumber!
endfunction
nnoremap <leader>rn :call ToggleRelativeNumber()<CR>

" mappings from within netrw, only apply to the netrw buffer
function! NetrwMapping()
  nmap <buffer> H u
  nmap <buffer> h -^
  nmap <buffer> l <CR>

  nmap <buffer> . gh
  nmap <buffer> P <C-w>z

  nmap <buffer> L <CR>:Lexplore<CR>
  nmap <buffer> <Leader>ee :Lexplore<CR>

  nmap <buffer> <TAB> mf
	nmap <buffer> <Leader><TAB> mu
endfunction

" set mappings when netrw is opened
augroup group_netrw
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

augroup group_filetype
  autocmd!
  autocmd filetype python nnoremap <buffer> <localleader>c I#<esc>
  autocmd filetype cpp nnoremap <buffer> <localleader>c I//<esc>
  autocmd filetype cpp nnoremap <buffer> <localleader>so istd::cout << << std::endl;<esc>BBhi
  autocmd filetype cpp nnoremap <buffer> <localleader>se istd::cerr << << std::endl;<esc>BBhi
augroup END
