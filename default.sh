# ------------------------------
# Default shell configuration
# ------------------------------
#
# set prompt
#
autoload colors
colors
setopt prompt_subst

# apple silicon arch display
APPLE_SILICON_DISPLAY=""
if test $(uname) = "Darwin" && arch -arm64e echo ok &>/dev/null; then
  if [ "$(uname -m)" = "x86_64" ]; then
    APPLE_SILICON_DISPLAY=" %F{magenta}x86_64%f%F{cyan}%f"
  elif [ "$(uname -m)" = "arm64" ]; then
    APPLE_SILICON_DISPLAY=" %F{white}arm64%f%F{cyan}%f"
  else
    APPLE_SILICON_DISPLAY=" %F{white}UNKNOWN%f%F{cyan}%f"
  fi
fi

PROMPT="%B%{$fg[cyan]%}[%n@%m${APPLE_SILICON_DISPLAY}]#%{$reset_color%}%b "

case ${UID} in
0)
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
  PROMPT="%B%{$fg[cyan]%}[%n@%m${APPLE_SILICON_DISPLAY}]#%{$reset_color%}%b "
  PROMPT2="%B%{$fg[red]%}%_#%{$reset_color%}%b "
  RPROMPT="%{$fg[cyan]%}(`rprompt_git_current_branch`%{$fg[cyan]%}%~%)%{$reset_color%}"
  SPROMPT="%B%{$fg[red]%}%r is correct? [n,y,a,e]:%{$reset_color%}%b "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
*)
  PROMPT="%{$fg[cyan]%}[%n@%m${APPLE_SILICON_DISPLAY}]%%%{$reset_color%} "
  PROMPT2="%{$fg[red]%}%_%%%{$reset_color%} "
  RPROMPT='%{$fg[cyan]%}(`rprompt_git_current_branch`%{$fg[cyan]%}%~%)%{$reset_color%}'
  SPROMPT="%{$fg[red]%}%r is correct? [n,y,a,e]:%{$reset_color%} "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
esac

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep


autoload -U compinit
compinit

# reporttime
export REPORTTIME=5
