# expand aliases before completing
setopt complete_aliases # aliased ls needs if file/dir completions work

case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -G -w"
  ;;
linux*)
  alias ls="ls --color"
  ;;
esac

alias reload="exec $SHELL -l"
alias a=alias
alias du="du -h"
alias df="df -h"
alias h="history"
alias j="jobs -l"
alias la="ls -aF"
alias lf="ls -F"
alias ll="ls -lF"
alias lla="ls -alF"
alias screen="screen -D -RR"
alias su="su -l"
alias va="vagrant"
alias va-running-list="va global-status | grep running | awk '{print $5}'"
alias where="command -v"

alias urlencode="nkf -wMQ | tr = %"
alias urldecode="nkf --url-input"

alias ymd="date +'%Y%m%d'"
alias ymdhms="date +'%Y%m%d%H%M%S'"

# peco-collection
alias find-p=' print -z $(find . | peco)'
alias find-d=' print -z $(find . -type d | peco)'
alias find-f=' print -z $(find . -type f | peco)'
alias pushd-p='print -z pushd +$(dirs -v | peco | head -n1 | awk '\''{print $1}'\'')'

alias ssh-p=' print -z ssh $(ssh-list | grep "^Host" | sed "s/^Host //g" | peco | awk '\''{print $1}'\'')'
if [ -f ~/dot.zsh/tmp/projects_paths.txt ]; then
  alias cd-p=' print -z cd $(cat ~/dot.zsh/tmp/projects_paths.txt | sed "s;${HOME};~;g" | peco)'
fi

# unicode decorder (\u1111 etc...)
alias unicode_decode="sed -e 's/\\\\u\(....\)/\&#x\1;/g' | nkf --numchar-input"
