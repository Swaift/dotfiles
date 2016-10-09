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

export class=/mnt/c/Users/Tawsif/Documents/_ut/EE312/
export down=/mnt/c/Users/Tawsif/Documents/_downloads/
export doc=/mnt/c/Users/Tawsif/Documents/

autoload -Uz colors
colors

#PROMPT=%n%%%{" "%}
PROMPT="%{$fg[yellow]%}%n%%%{$reset_color%} "
RPROMPT="%{$fg_bold[white]%}%~%{$reset_color%}"

alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
git config --global user.email "tawsifazad@gmail.com"
git config --global user.name "Tawsif Azad"
git config --global  status.showUntrackedFiles no
