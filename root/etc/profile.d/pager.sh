#!/bin/sh
# /etc/profile.d/less
# Colors for pager, and assign default pager

MANPAGER=less
PAGER=less
LESS_TERMCAP_mb="$(tput setaf 1)" # begin blinking (red)
LESS_TERMCAP_md="$(tput setaf 3)" # begin bold (yellow)
LESS_TERMCAP_me="$(tput sgr0)" # end mode (reset)
LESS_TERMCAP_so="$(tput setaf 4)" # begin standout-mode - info box (blue)
LESS_TERMCAP_se="$(tput sgr0)" # end standout-mode (reset)
LESS_TERMCAP_us="$(tput setaf 5)" # underline start (magenta)
LESS_TERMCAP_ue="$(tput sgr0)" # underline end (reset)

export MANPAGER PAGER
export LESS_TERMCAP_mb LESS_TERMCAP_md LESS_TERMCAP_me 
export LESS_TERMCAP_so LESS_TERMCAP_se LESS_TERMCAP_us LESS_TERMCAP_ue

# End of file
