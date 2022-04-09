# detect apple silicon
if arch -arm64e echo ok &>/dev/null; then
  # x86_64 or arm64
  arch_suffix="$(uname -m)"

  # x86_64モードでもarm64 brewで入れたコマンドを使いたい
  path=(
    /opt/homebrew-arm64/bin(-N)
    /opt/homebrew-x86_64/bin(-N)
    # /opt/homebrew-${arch_suffix}/bin(-N)
    $path
  )
  # brewコマンドは常に現在のarchに従ったものを使う ()
  alias brew=/opt/homebrew-${arch_suffix}/bin/brew

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
fi
