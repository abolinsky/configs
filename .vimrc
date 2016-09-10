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

" enable mouse support
"if has('mouse')
"  set mouse=a
"endif

" window splitting
set splitright
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" better page-up and page-down
nnoremap <C-k> <PageUp>
nnoremap <C-j> <PageDown>

" auto print statement
autocmd FileType cpp nmap <buffer> <C-c> i << ::std::endl;<esc>5bhi::std::cout <<<space>
autocmd FileType javascript nmap <buffer> <C-c> i);<esc>hiconsole.log(

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

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
