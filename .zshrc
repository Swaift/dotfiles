# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tawsif/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export ut=/mnt/c/Users/Tawsif/Documents/_ut/
export doc=/mnt/c/Users/Tawsif/Documents/
export proj=/mnt/c/Users/Tawsif/Documents/_projects/
export cv=/mnt/c/Users/Tawsif/Documents/_resumes/cv/
export down=/mnt/c/Users/Tawsif/Downloads/

autoload -Uz colors
colors

#PROMPT=%n%%%{" "%}
#PROMPT="%{$fg_bold[white]%}%n%%%{$reset_color%} "
#RPROMPT="%{$fg_bold[white]%}%~%{$reset_color%}"
PROMPT="%{[3m%}%{$fg_bold[white]%}%n%%%{$reset_color%}%{[0m%} "
RPROMPT="%{[3m%}%{$fg_bold[white]%}%~%{$reset_color%}%{[0m%} "

alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
#git config --global user.email "tawsifazad@gmail.com"
#git config --global user.name "Tawsif Azad"
#git config --global  status.showUntrackedFiles no

export DEVKITPRO=/home/tawsif/devkitPro
export DEVKITARM=${DEVKITPRO}/devkitARM

alias ls='ls -p1 -X'
alias :q='exit'

#export NVM_DIR="/home/tawsif/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#eval "$(thefuck --alias)"
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
#alias tmux="env TERM=xterm-256color tmux -2"

#alias jc='javac -d ../bin *.java'
#alias j='java -cp ../bin assignment2.Driver'
alias jc='javac -d ./bin *.java'
alias j='java -cp ./bin Driver'
alias jt='java -cp ./bin DriverTies'

bindkey "^?" backward-delete-char

# github ssh-agent script

env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi

unset env
