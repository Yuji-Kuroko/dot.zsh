function openssl_decrypt() {
  if [ $# = 0 ]; then
    echo 'require: filename.encrypted'
  else
    openssl aes-256-cbc -d -in $1 -out $(echo ${1} | sed 's;.encrypted$;;g')
  fi
}
