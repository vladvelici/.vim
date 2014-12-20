# Bundles directory:
BUNDLES_DIR=~/.vim/bundle/

# Vundle plugin directory
VDIR=${BUNDLES_DIR}Vundle.vim

all: vundle plugins

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


