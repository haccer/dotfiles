.PHONY: all
all: nvim go

.PHONY: test
test:
	echo "Welcome to dotfiles"

.PHONY: nvim
nvim:
	[ -f /usr/bin/nvim ] || sudo apt-get install neovim
	[ -d ~/.config/nvim ] || mkdir ~/.config/nvim
	ln -sfn ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim
	ln -sfn ~/.dotfiles/nvim/vimrc ~/.vimrc
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim -E -u NONE +PluginInstall +qall > /dev/null

.PHONY: go
go:
	[ -d /usr/local/go ] || cd ~/.dotfiles/go && chmod 775 install.sh; ./install.sh
