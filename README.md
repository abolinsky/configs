# configs
configuration files for vim, git, and tmux

## tools used:

### pathogen (runtimepath manager)
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

### fugitive (vim git wrapper)
cd ~/.vim/bundle
git clone git://github.com/tpope/vim-fugitive.git
vim -u NONE -c "helptags vim-fugitive/doc" -c q

### tmux (terminal multiplexer))

### tagbar (current file tags sidebar)

### exuberant ctags (language objects indexer)

### the silver searcher (search)
mac: brew install the_silver_searcher

### jshint (javascript linter)

todo:
setup script to install all of these tools if not present
