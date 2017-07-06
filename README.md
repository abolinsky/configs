# configs
configuration files for vim, git, and tmux

## tools used:

### pathogen (runtimepath manager)
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

### fugitive (vim git wrapper)
cd ~/.vim/bundle && \
git clone git://github.com/tpope/vim-fugitive.git && \
vim -u NONE -c "helptags vim-fugitive/doc" -c q

### tmux (terminal multiplexer))
git clone https://github.com/tmux/tmux.git && \
cd tmux && \
sh autogen.sh && \
./configure && make

### tmux plugin manager (TPM)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

### tmux plugins
mem-cpu-load: cd ~.tmux/plugins && \
git clone git@github.com:thewtex/tmux-mem-cpu-load.git && \
cd tmux-mem-cpu-load && \
sudo cmake . && \
make && \
sudo make install

### vim airline (status bar)
cd ~/.vim/bundle && \
git clone https://github.com/bling/vim-airline

### the silver searcher (search)
mac: brew install the_silver_searcher \
ubuntu: sudo apt-get install silversearcher-ag

### exuberant ctags (language objects indexer)
sudo apt-get install exuberant-ctags

### vim tagbar (current file tags sidebar)
cd ~/.vim/bundle && \
git clone git://github.com/majutsushi/tagbar.git

### jshint (javascript linter)

todo:
setup script to install all of these tools if not present
