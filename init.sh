if type direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

if type anyenv >/dev/null 2>&1; then
  eval "$(anyenv init -)"
fi

if [ -d ~/.zinit/bin ]; then
  . ~/.zinit/bin/zinit.zsh
fi

if type zinit >/dev/null 2>&1; then
  zinit light zsh-users/zsh-syntax-highlighting
  zinit light zsh-users/zsh-completions
fi