#
# ~/.profile
# Author: Todd Gaunt
# Description: Generic shell configuration file.

# Directory for extra modular shell scripts
PROFILE_DIR="$HOME/.profile.d"

# PATHS
PATH="$HOME/bin:$HOME/opt:$PATH"
export PATH

# History size
HISTSIZE=10000
HISTFILESIZE=10000

# Default pager settings
PAGER="less"
LESS="-irX"
export PAGER
export LESS

# Vi editing mode
#set -o vi
set -o emacs

# Default text editor setting
if [ -x "$(command -v nvim)" ];then
	EDITOR="nvim"
	VISUAL="nvim"
elif [ -x "$(command -v vim)" ];then
	EDITOR="vim"
	VISUAL="vim"
else
	EDITOR="vi"
	VISUAL="vi"
fi

export VISUAL
export EDITOR

# Default web browser settings
if [ -x "$(command -v surf)" ];then
	BROWSER="surf"
elif [ -x "$(command -v firefox)" ];then
	BROWSER="firefox"
else
	BROWSER="links"
fi

export BROWSER

# Disable Software flow control (ctrl-z ctrl-q)
stty -ixon

# XDG directory specification
XDG_CONFIG_HOME="$HOME/etc"
XDG_RUNTIME_DIR="$HOME/tmp"
XDG_CONFIG_DATA="$HOME/var/local"
XDG_CONFIG_CACHE="$HOME/var/cache"
XDG_CONFIG_STATE="$HOME/var/state"

export XDG_CONFIG_HOME XDG_RUNTIME_DIR XDG_CONFIG_DATA 
export XDG_CONFIG_CACHE XDG_CONFIG_STATE

# Useful XDG user dirs
XDG_DOWNLOAD_DIR="$HOME/var/download"
XDG_TEMPLATES_DIR="$HOME/var/template"
XDG_PUBLICSHARE_DIR="$HOME/pub"

export XDF_DOWNLOAD_DIR XDG_PUBLICSHARE_DIR XDG_TEMPLATES_DIR

# XDG dirs
XDG_DESKTOP_DIR="$HOME/.desktop"
XDG_DOCUMENTS_DIR="$HOME/usr/doc"
XDG_MUSIC_DIR="$HOME/usr/snd"
XDG_PICTURES_DIR="$HOME/usr/pic"
XDG_VIDEOS_DIR="$HOME/usr/mov"

export XDG_DESKTOP_DIR XDG_DOCUMENTS_DIR XDG_MUSIC_DIR
export XDG_PICTURES_DIR XDG_VIDEOS_DIR

# GPG-Agent
if test -f $HOME/.gpg-agent-info && kill -0 $(cut -d: -f 2 $HOME/.gpg-agent-info) 2>/dev/null; then
  GPG_AGENT_INFO=$(cat $HOME/.gpg-agent-info)
  export GPG_AGENT_INFO
else
  eval $(gpg-agent --daemon)
  echo $GPG_AGENT_INFO >$HOME/.gpg-agent-info
fi
GPG_TTY=$(tty)
export GPG_TTY

# End of file
