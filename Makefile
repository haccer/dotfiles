.PHONY: all
all: vim

.PHONY: vim
vim:
	ln -sfn ~/.dotfiles/vim/vimrc ~/.vimrc
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
