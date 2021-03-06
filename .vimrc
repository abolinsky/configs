" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
filetype plugin indent on
syntax on

" redefine leader to ,
let mapleader="\<space>"

" hit backspace without this one and see for yourself
set backspace=indent,eol,start

" non-relative numbering
set number
set numberwidth=4

" tab spacing to two 
set tabstop=2
set autoindent
set expandtab
set laststatus=2
set smarttab
set softtabstop=2

" searching
set incsearch
set ignorecase
set smartcase
set hlsearch

" shifting
set shiftwidth=2
set shiftround

" folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable

" enable mouse support
if has('mouse')
  set mouse=a
endif

" window splitting
set splitright
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" better page-up and page-down
nnoremap <C-k> <PageUp>
nnoremap <C-j> <PageDown>

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" auto print statement
autocmd FileType cpp nmap <buffer> <C-c> i << ::std::endl;<esc>5bhi::std::cout <<<space>
autocmd FileType javascript nmap <buffer> <C-c> i);<esc>hiconsole.log(

" pathogen runtime path manager
execute pathogen#infect()

" tagbar
nnoremap <C-l> :TagbarToggle<CR>

" fugitive
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>gst :Gstatus<CR>
nnoremap <Leader>gsq :Git rebase -i<CR>
nnoremap <Leader>gc :Gcommit -v -q<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR><CR>
nnoremap <Leader>gl :Git log<CR>
nnoremap <Leader>gm :Gmerge<Space>
nnoremap <Leader>go :Git checkout<Space>
nnoremap <Leader>gbr :Git branch<Space>
nnoremap <Leader>gbl :Gblame<CR>
nnoremap <Leader>gps :Gpush<CR>
nnoremap <Leader>gpl :Gpull<CR>

" jshint
set runtimepath+=~/.vim/bundle/jshint2.vim/

" Source the vimrc file after saving it
augroup vimrc
  if has("autocmd")
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd BufWritePost .vimrc source $MYVIMRC
  endif
augroup end

" make vim search for tag files from the current directory up to the home
" folder. This makes searching for relevant code in large codebases easier
set iskeyword+=-
set iskeyword+=/
set tags=./tags,tags;$HOME " Walk up from current directory to the $HOME looking for tag files

" tag stuff
map <C-\> :vsp<CR>:exec("tag ".expand("<cword>"))<CR>

" map the k+j keystrokes to escape
imap kj <Esc>

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" colors
hi TabLineFill ctermfg=255 ctermbg=250
hi TabLine ctermfg=White ctermbg=235
hi TabLineSel ctermfg=Black ctermbg=Yellow

" vim airlines
let g:airline_section_y=''
let g:airline_section_z=''
let g:airline_right_sep=''
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#default#section_truncate_width = {
      \ 'x': 60,
      \ 'y': 88,
      \ 'z': 45,
      \ 'warning': 80,
      \ 'error': 80,
      \ }

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
