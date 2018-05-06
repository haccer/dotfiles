.PHONY: all
all: nvim go zsh

.PHONY: test
test:
	echo "Welcome to dotfiles"

.PHONY: nvim
nvim:
	[ -f /usr/bin/nvim ] || sudo add-apt-repository ppa:neovim-ppa/stable && sudo apt-get update && sudo apt-get install -y neovim
	[ -d ~/.config/nvim ] || mkdir ~/.config/nvim
	ln -sfn ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim
	ln -sfn ~/.dotfiles/nvim/vimrc ~/.vimrc
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	[ -d ~/.vim/colors ] || mkdir ~/.vim/colors
	wget https://raw.githubusercontent.com/gosukiwi/vim-atom-dark/master/colors/atom-dark-256.vim -O ~/.vim/colors/atom-dark-256.vim
	vim +PluginInstall +qall

.PHONY: go
go:
	[ -d /usr/local/go ] || cd ~/.dotfiles/go && chmod 775 install.sh; ./install.sh

.PHONY: zsh
zsh:
	[ -f /usr/bin/zsh ] || sudo apt-get install zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	ln -sfn ~/.dotfiles/zsh/haccer.zsh-theme ~/.oh-my-zsh/themes/haccer.zsh-theme
	rm ~/.zshrc; ln -sfn ~/.dotfiles/zsh/zshrc ~/.zshrc
	source ~/.zshrc
