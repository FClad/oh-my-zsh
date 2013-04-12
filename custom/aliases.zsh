# Custom aliases

alias ls="ls -G"
alias la="ls -a"
alias ll="ls -la"

alias tmux="TERM=screen-256color-bce tmux"

alias ntpforcesync="sudo ntpdate -u $(systemsetup -getnetworktimeserver|awk '{print $4}')"

alias memgrind="valgrind --leak-check=full --track-origins=yes"

alias make="colormake"

