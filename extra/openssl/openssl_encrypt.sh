function openssl_encrypt() {
  if [ $# = 0 ]; then
    echo 'require: filename'
  else
    openssl aes-256-cbc -e -in $1 -out ${1}.encrypted
  fi
}
