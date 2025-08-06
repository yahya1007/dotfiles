#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -la'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Path for exe app
export PATH=/home/yahya/.local/bin/:$PATH

#Pacman
alias s='pacman -Ss'
alias i='doas pacman -S'
alias u='doas pacman -Syu #--noconfirm'
alias r='doas pacman -Rs'

# Vim
alias v='vim'

# Colour codes
RED="\\[\\e[1;31m\\]"
GREEN="\\[\\e[1;32m\\]"
YELLOW="\\[\\e[1;33m\\]"
BLUE="\\[\\e[1;34m\\]"
MAGENTA="\\[\\e[1;35m\\]"
CYAN="\\[\\e[1;36m\\]"
WHITE="\\[\\e[1;37m\\]"
ENDC="\\[\\e[0m\\]"

#PS1='[\u@\h \W]\$ '
PS1="${BLUE}\w  ${GREEN}\$${ENDC} "

#PATH TEXLIVE 
 export PATH=/usr/local/texlive/2025/bin/x86_64-linux:$PATH
 export MANPATH=/usr/local/texlive/2025/texmf-dist/doc/man:$MANPATH
 export INFOPATH=/usr/local/texlive/2025/texmf-dist/doc/info:$INFOPATH
 # space betwin lines
eval "$(starship init bash)"


#Texlive
alias tli='doas tlmgr install'
alias tlu='doas tlmgr update --self;doas tlmgr update -all'
alias tlr='doas tlmgr remove'
alias tls='doas tlmgr search'


#Alias for DL and DS
alias  dl1pr='cd ~/Documents/latexExam/As23_24/Privee/Dl/Math1/'
alias  dl2pr='cd ~/Documents/latexExam/As23_24/Privee/Dl/Math2/'
alias  dl3pr='cd ~/Documents/latexExam/As23_24/Privee/Dl/Math3/'
alias  dl1pu='cd ~/Documents/latexExam/As23_24/Publique/Dl/Math1/'
alias  dl2pu='cd ~/Documents/latexExam/As23_24/Publique/Dl/Math2/'
alias  dl3pu='cd ~/Documents/latexExam/As23_24/Publique/Dl/Math3/'
alias  ds1pr='cd ~/Documents/latexExam/As23_24/Privee/Ds/Math1/'
alias  ds2pr='cd ~/Documents/latexExam/As23_24/Privee/Ds/Math2/'
alias  ds3pr='cd ~/Documents/latexExam/As23_24/Privee/Ds/Math3/'
alias  ds1pu='cd ~/Documents/latexExam/As23_24/Publique/Ds/Math1/'
alias  ds2pu='cd ~/Documents/latexExam/As23_24/Publique/Ds/Math2/'
alias  ds3pu='cd ~/Documents/latexExam/As23_24/Publique/Ds/Math3/'

#Clean arch linux
#1 pacman cache
alias cln='doas pacman -Sc'
alias clna='doas pacman -Scc'
#2 Unused packages
alias unused='doas pacman -Qdtq'
alias clnu='doas pacman -R $(unused)'
alias clnc='rm -rf ~/.cache/*'
alias clnt='rm -rf ~/Trash/'
