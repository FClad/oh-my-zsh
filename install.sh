#!/bin/bash

# Retrieve path to the current directory
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# Create a symbolic link to this folder from $HOME/.oh-my-zsh
if [ "${DIR}" != "${HOME}/.oh-my-zsh" ]; then
	if [ -e "${HOME}/.oh-my-zsh" ]; then
		echo "Warning: a .oh-my-zsh folder already exists. Old folder moved to oh-my-zsh_orig."
		mv ${HOME}/.oh-my-zsh ${HOME}/oh-my-zsh_orig
	fi
	echo "Creating symbolic link for .oh-my-zsh folder."
	ln -s ${DIR} ${HOME}/.oh-my-zsh
fi

# Create a symbolic link to zshrc file from $HOME/.zshrc
if [ ! -L "${HOME}/.zshrc" ]; then
	if [ -e "${HOME}/.zshrc" ] ; then
		echo "Warning: a .zshrc file already exists. Old file moved to zshrc_orig."
		mv ${HOME}/.zshrc ${HOME}/zshrc_orig
	fi
	echo "Creating symbolic link for .zshrc file."
	ln -s ${DIR}/zshrc ${HOME}/.zshrc
fi

