#!/bin/bash

osname=(`uname -s`)
echo "Installing dotfiles in $osname"

pyenvinit='
\nexport PYENV_ROOT="$HOME/.pyenv"
\nexport PATH="$PYENV_ROOT/bin:$PATH"
\neval "$(pyenv init -)"
\neval "$(pyenv virtualenv-init -)"'

xtermcolor='
\nexport TERM="xterm-256color"'

# copy aliases and vim/tmux configs
cp .bash_aliases ~
chmod 644 ~/.bash_aliases
cp .tmux.conf ~
cp .vimrc ~

if [ $osname = "Darwin" ]; then
	# install libs on mac
	brew install gnupg oathtool git vim ripgrep tmux pyenv wget pgcli
	brew install --HEAD universal-ctags/universal-ctags/universal-ctags

	# copy pyenv init to .bash_profile
	echo -e $pyenvinit >> ~/.bash_profile
	echo -e $xtermcolor >> ~/.bash_profile
	source ~/.bash_profile
else
	# install libs on debian's like 
	sudo apt install gnupg oathtool git vim ripgrep tmux wget libpq-dev libsqlite3-dev pgcli universal-ctags curl cmake

	# install pyenv
	git clone https://github.com/pyenv/pyenv.git ~/.pyenv
	git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

	echo -e $pyenvinit >> ~/.bashrc
	source ~/.bashrc
fi

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall

# verify vim was installed with python3 and try to install youcompleteme
vimwithpython3=(`vim --version | grep -e "+python3" | wc -l`)
if [ $vimwithpython3 -eq 0 ]; then
	echo "****************************************"
	echo "YouCompleteMe can't be installed because"
	echo "vim wasn't compiled with python3        "
	echo "****************************************"
else
	python3 ~/.vim/bundle/YouCompleteMe/install.py --clang-completer
fi


# install ctrlp
git clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim

echo $'Done \360\237\215\272'
