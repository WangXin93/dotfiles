#=========================git prompts=========================
# Enable tab completion
source ~/git-completion.bash

# colors!
green="\[\033[0;32m\]"
blue="\[\033[01;34m\]"
purple="\[\033[01;35m\]"
yellow="\[\033[01;33m\]"
red="\[\033[0;31m\]"
reset="\[\033[0m\]"

# Change command prompt
source ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="$purple\u@\h$green\$(__git_ps1)$blue \W $yellow\D{%F %T} \n$blue\$ $reset"

#====================fzf configuration=========================
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

#=======================Map CapsLock to Ctrl==================                                                
# setxkbmap -option caps:ctrl_modifier

#================Share history between tmux sessions==========                                                
# https://www.bilibili.com/video/av9523461/?p=11
shopt -s histappend
shopt -s histreedit
shopt -s histverify
HISTCONTROL='ignoreboth'
PROMPT_COMMAND="history -a;history -c;history -r; $PROMPT_COMMAND"

#====================Define less editor========================
export EDITOR=vim
alias vi='vim'

