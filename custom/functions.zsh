
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

