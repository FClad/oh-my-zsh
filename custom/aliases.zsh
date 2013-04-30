
# Load system specific aliases
if [[ $OSTYPE == "linux-gnu" ]]; then
	source $ZSH/custom/aliases.linux
elif [[ ${OSTYPE//[0-9.]/} == "darwin" ]]; then
	source $ZSH/custom/aliases.osx
fi

# Custom aliases

alias la="ls -a"
alias ll="ls -la"

alias tmux="TERM=screen-256color-bce tmux"

alias memgrind="valgrind --leak-check=full --track-origins=yes"

alias make="colormake"

