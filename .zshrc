# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch completeinword interactivecomments
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tawsif/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

export ut=/mnt/c/Users/Tawsif/Documents/_ut/
export doc=/mnt/c/Users/Tawsif/Documents/
export taws=/mnt/c/Users/Tawsif/
export proj=/mnt/c/Users/Tawsif/Documents/_projects/
export cv=/mnt/c/Users/Tawsif/Documents/_resumes/cv/
export down=/mnt/c/Users/Tawsif/Downloads/
export lab=/mnt/c/Users/Tawsif/Documents/_ut/comp/labs/lab3/

autoload -Uz colors
colors

#PROMPT=%n%%%{" "%}
#PROMPT="%{$fg_bold[white]%}%n%%%{$reset_color%} "
#RPROMPT="%{$fg_bold[white]%}%~%{$reset_color%}"
PROMPT="%{[3m%}%{$fg_bold[white]%}%n%#%{$reset_color%}%{[0m%} "
RPROMPT="%{[3m%}%{$fg_bold[white]%}%~%{$reset_color%}%{[0m%} "

alias dot='/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME'
alias wsl='/usr/bin/git --git-dir=$HOME/.wsl/ --work-tree=/mnt/c/Users/Tawsif'

export DEVKITPRO=/home/tawsif/devkitPro
export DEVKITARM=${DEVKITPRO}/devkitARM

alias n='ncmpcpp'
alias whatismyip="curl httpbin.org/ip 2>/dev/null | grep origin | cut -d '\"' -f 4"
alias ll='ls -l'
alias la='ls -a'
alias ai='sudo apt-get install'
alias ar='sudo apt-get remove'
alias s='ssh toad'
ss () {
    scp "$*" toad:.;
}

alias m='make'
alias mm='make && make test'

if [[ -x "`whence -p dircolors`" ]]; then
  eval `dircolors -b ~/.dir_colors`
  alias ls='ls -F -p1 -X --color'
else
  alias ls='ls -F -p1 -X'
fi
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#alias z='zathura &> /dev/null'
z () {
    zathura &> /dev/null "$*" & disown;
}

same-dir-terminal () {
    urxvtc -e zsh &> /dev/null &
}
zle -N same-dir-terminal
bindkey '' same-dir-terminal

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

alias jc='javac -cp /usr/share/java/junit4-4.11.jar -d bin src/assignment4/*.java test_sample/assignment4/*.java'
alias j='java -cp bin assignment4.Main'
alias jt='java -cp /usr/share/java/junit4-4.11.jar:/usr/share/java/hamcrest-core-1.3.jar:bin org.junit.runner.JUnitCore assignment4.A4SampleTest2'

bindkey "^?" backward-delete-char

source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

#source ~/.zplug/init.zsh
#zplug "zsh-users/zsh-syntax-highlighting", defer:2
#if ! zplug check; then
    #printf "Install? [y/N]: "
    #if read -q; then
        #echo; zplug install
    #fi
#fi
#zplug load

umask 022

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
