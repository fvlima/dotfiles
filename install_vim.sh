python_config_dir=$PYTHON_CONFIG_DIR

if [ -z $python_config_dir ]; then
        echo "Oops, where is the python config dir?"
        exit 1
fi

install_path="/usr/local/bin"

sudo apt-get build-dep vim

cd /tmp

git clone https://github.com/vim/vim.git

cd vim/src

$ ./configure --with-features=huge \
              --enable-multibyte \
              --enable-rubyinterp \
              --enable-python3interp \
              --with-python3-config-dir=$python_config_dir \
              --enable-perlinterp \
              --enable-luainterp \
              --enable-cscope \
              --enable-gui=auto \
              --enable-gtk2-check \
              --with-x \
              --with-compiledby="j.jith" \
	      --prefix=$install_path

make && sudo make install

sudo update-alternatives --install /usr/bin/editor editor $install_path 1
