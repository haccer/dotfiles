CUR="$(HOME)/.dotfiles"

all: vim

vim:
        ln -sfn $(CUR)/vim/vimrc ~/.vimrc
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        vim +PluginInstall +qall
