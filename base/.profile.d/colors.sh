#!/bin/sh
# /etc/profile.d/dircolors.sh
# Sets colors and alias colors for commands

if [ -f "/etc/dircolors" ] ; then
	eval $(dircolors -b /etc/dircolors)

	if [ -f "$HOME/.dircolors" ] ; then
		eval $(dircolors -b $HOME/.dircolors)
	fi
fi

if [ $(uname) == "Linux" ];then
	alias ls='ls --color=auto'	
	alias grep='grep --color=auto'
elif [ $(uname) == "FreeBSD" ];then
	alias ls='ls -G'
fi

# End of file
