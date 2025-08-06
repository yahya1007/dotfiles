#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export BROWSER="chromium"
export TERMINAL="st"
export TERM="st"
export READER="zathura"
export EDITOR="vim"
export PDF_VIEWER="zathura"
export DMENU="dmenu -i -l 20 -p"
export VISUAL="vim"
export PREVIEW='feh'

#startx
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi

