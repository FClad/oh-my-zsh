
# Allow special commands such as Ctrl-S or Ctrl-Z to be bound inside Vim
vim() {
    local STTYOPTS="$(stty -g)"
    stty stop '' -ixoff
    command vim "$@"
    stty "$STTYOPTS"
}


# Provide handy session management for tmux
tm() {
	if [[ -z $1 ]]; then
		list=`tmux ls 2> /dev/null`
		if [[ $? -eq 1 ]]; then
			echo "Usage: tm <session>";
		else
			nb=`echo "$list" | wc -l | sed 's/ //g'`
			if [[ $nb == "1" ]]; then
				tmux attach
			else
				echo "Select one of these sessions:";
				tmux ls;
			fi
		fi
		return 1;
	else
		(tmux has -t $1 &> /dev/null) && tmux attach -t $1 || tmux new -s $1
	fi
}


# For colored man pages
# (source: https://wiki.archlinux.org/index.php/Man_Page)
man() {
	env LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		man "$@"
}

