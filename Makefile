.PHONY: all
all: vim go

.PHONY: vim
vim:
	ln -sfn ~/.dotfiles/vim/vimrc ~/.vimrc
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

.PHONY: go
go:
	[ -d /usr/local/go/bin ] || cd ~/.dotfiles/go && chmod 775 install.sh; ./install.sh
