# 
# ~/.bashrc
# Author: Todd Gaunt
# Description: Configuration file for bash.

# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# Source .profile first for generic shell configuration.
[[ -f ~/.profile ]] && . ~/.profile

# PS1 and PS2 customization.
PS1='\u@\h:\w\n(\j)-> '
PS2='(\j)--> '

# Platform specific aliases
if [ $(uname) == "Linux" ];then
	alias fuck='pulseaudio --kill && pulseaudio --start'
fi

alias cx='chmod +x'
alias hs='history | grep'
alias sxiv='sxiv -a'
alias vi='vim'
alias v='vim'
alias ls='ls --color=auto'

# End of file
