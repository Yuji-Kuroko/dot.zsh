# detect apple silicon
if arch -arm64e echo ok &>/dev/null; then
  # x86_64 or arm64
  arch_suffix="$(uname -m)"

  homebrew_arm_path=${APPLE_SILICON_ARM_BREW_PATH:-"/opt/homebrew"}
  homebrew_x86_path=${APPLE_SILICON_X86_BREW_PATH:-"/usr/local"}

  # x86_64モードでもarm64 brewで入れたコマンドを使いたい
  path=(
    ${homebrew_arm_path}/bin(-N)
    ${homebrew_x86_path}/bin(-N)
    # /opt/homebrew-${arch_suffix}/bin(-N)
    $path
  )

  # brewコマンドは常に現在のarchに従ったものを使う ()
  if [[ "$arch_suffix" == "arm64" ]]; then
    alias brew=${homebrew_arm_path}/bin/brew
  elif [[ "$arch_suffix" == "x86_64" ]]; then
    alias brew=${homebrew_x86_path}/bin/brew
  fi

  if [ -d /opt/asdf-${arch_suffix} ]; then
    export ASDF_DIR=/opt/asdf-${arch_suffix}
    export ASDF_DATA_DIR=$ASDF_DIR
    ASDF_BIN="${ASDF_DIR}/bin"
    ASDF_USER_SHIMS="${ASDF_DATA_DIR}/shims"
    path=(
      $ASDF_BIN
      $ASDF_USER_SHIMS
      $path
    )
    
    . /opt/asdf-${arch_suffix}/asdf.sh
  fi
  

  # if [ $(uname -m) = 'x86_64' ]; then
  #
  # elif [ $(uname -m) = 'arm64' ]; then
  #
  # fi

  alias a64="unset PATH && /usr/bin/arch -arm64e /bin/zsh"
  alias x64="unset PATH && /usr/bin/arch -x86_64 /bin/zsh"
  alias arm=a64
  alias x86=x64

  #------------
  # /init.sh と同じことをやる
  # ※ init.shを最初に呼んだとき、pathが設定されてなくて正常動作しない。ここで行う
  #------------
  if type direnv >/dev/null 2>&1; then
    eval "$(direnv hook zsh)"
  fi

  if type anyenv >/dev/null 2>&1; then
    eval "$(anyenv init -)"
  fi

  if [ -d ~/.local/share/zinit/zinit.git ]; then
    . ~/.local/share/zinit/zinit.git/zinit.zsh
  fi

  if type zinit >/dev/null 2>&1; then
    zinit light zsh-users/zsh-syntax-highlighting
    zinit light zsh-users/zsh-completions
  fi

  #------------
  # /conf.d/keybind.sh でpathが必要なものの設定をやる
  #------------
  # peco
  if type peco >/dev/null 2>&1; then
    function peco-history-selection() {
        BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
        CURSOR=$#BUFFER
        zle reset-prompt
    }

    zle -N peco-history-selection
    bindkey '^R' peco-history-selection
  fi
fi
