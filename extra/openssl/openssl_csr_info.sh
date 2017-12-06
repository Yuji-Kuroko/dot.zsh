function openssl_csr_info() {
  if [ $# = 0 ]; then
    echo 'require: path_to_csr'
  else
    openssl req -in $1 -text
  fi
}
