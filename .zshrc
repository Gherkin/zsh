# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000000
setopt appendhistory extendedhistory inc_append_history_time beep extendedglob nomatch notify autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/niyohn/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Also Auto-complete aliases
setopt COMPLETE_ALIASES
zmodload zsh/complist
zstyle ':completion:*' menu select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
fpath=(/usr/local/share/zsh-completions $fpath)

#Git CLI alias
alias 'gs'='git status'
alias 'gc'='git commit'
alias 'gp'='git push'
alias 'gd'='git diff'
alias 'ga'='git add'
alias 'gu'='git pull'

#Knife alias
alias 'kcu'='knife cookbook upload'
alias 'kcl'='knife cookbook list'
alias 'keff'='knife environment from file'
alias 'krff'='knife role from file'

# Adding correcting of misspelled commands and paths
#setopt correct
#setopt correctall

# vim from MacVim
alias vim='/Applications/mvim -v'
export VISUAL='/Applications/mvim -v'
#Switch between java versions
alias jdk6='export JAVA_HOME=$(/usr/libexec/java_home -v 1.6)'
alias jdk7='export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)'
alias jdk8='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'
jdk8
# JRebel Java Agent
export REBEL_HOME=/Users/niyohn/jrebel
alias rebel='MAVEN_OPTS="-noverify -javaagent:$REBEL_HOME/jrebel.jar $MAVEN_OPTS"'

alias 'cd'='pushd'

# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

if [[ "${terminfo[kcbt]}" != "" ]]; then
	bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards
fi

#source /Users/niyohn/Documents/git/zsh-git-prompt/zshrc.sh

PS1="[%~]%% "
zle
#function zle-line-init zle-keymap-select {
#    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
#    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_super_status) $EPS1"
#    zle reset-prompt
#}

#zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

PATH=/opt/maven-3.1.1/bin:$PATH:/Users/niyohn/Documents/Scripts
PATH="$PATH:."
PATH="/Users/niyohn/Library/Python/2.7/bin/:$PATH"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="/usr/local/sbin:$PATH"
PATH="/Users/niyohn/bin:$PATH"
PATH="/Users/niyohn/Documents/git/ms/ms_scripts:$PATH"

#MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
export EDITOR='/Applications/mvim -v'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8  

# Iterm 2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# SSH Host tab-completion
h=()
if [[ -r ~/.ssh/config ]]; then
  h=($h ${${${(@M)${(f)"$(cat ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
fi
if [[ -r ~/.ssh/known_hosts ]]; then
  h=($h ${${${(f)"$(cat ~/.ssh/known_hosts{,2} || true)"}%%\ *}%%,*}) 2>/dev/null
fi
if [[ $#h -gt 0 ]]; then
  zstyle ':completion:*:ssh:*' hosts $h
  zstyle ':completion:*:slogin:*' hosts $h
fi

eval "$(rbenv init -)"


#MS
alias mfa=aws-mfa.sh
alias 'ms=cd /Users/niyohn/Documents/git/ms'
