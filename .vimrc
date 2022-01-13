" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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

" auto print statement
autocmd FileType cpp nmap <buffer> <C-c> i << ::std::endl;<esc>5bhi::std::cout <<<space>
autocmd FileType javascript nmap <buffer> <C-c> i);<esc>hiconsole.log(

" pathogen runtime path manager
execute pathogen#infect()

" tagbar
nnoremap <C-l> :TagbarToggle<CR>

" fugitive (git wrapper)
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

" nerdtree (file explorer)
nnoremap <silent> <C-t> :NERDTreeToggle<CR>

" ctrlp (fuzzy finder)
set runtimepath^=~/.vim/bundle/ctrlp.vim

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

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
