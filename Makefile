# Bundles directory:
BUNDLES_DIR=~/.vim/bundle/

# Vundle plugin directory
VDIR=${BUNDLES_DIR}Vundle.vim

# Makefile directory
HERE=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all: vundle plugins symlink folders

# Install Vundle plugins
plugins:
	vim +PluginInstall +qall

# Download vundle
vundle: ${VDIR}

${VDIR}:
	git clone https://github.com/gmarik/Vundle.vim.git ${VDIR}

# Update vundle
updateVundle:
	cd ${BUNDLES_DIR}Vundle.vim
	git pull

update:
	vim +PluginUpdate +PluginInstall!

symlink:
	cd ~ && pwd && ln -s ${HERE}/vimrc .vimrc

folders:
	mkdir -p ~/.vim/backup
	mkdir -p ~/.vim/swap
