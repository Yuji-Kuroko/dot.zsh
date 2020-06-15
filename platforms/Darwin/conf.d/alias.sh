# application alias
alias cot="open -a CotEditor"
alias chrome="open -a /Applications/Google\ Chrome.app"
alias st="open -a SourceTree"

alias ssh-list="cat ~/.ssh/config ~/.ssh/conf.d/*/*.conf | less"
alias my_branch="git rev-parse --abbrev-ref @"
# notice ex)rails_start; notice
alias notice='terminal-notifier -message "finisshed the command"'

alias ssh="color_change_ssh"
alias clear_term_bgcolor="set_term_bgcolor 0 0 0"

if type rmtrash >/dev/null 2>&1; then
  alias rm=rmtrash
fi
