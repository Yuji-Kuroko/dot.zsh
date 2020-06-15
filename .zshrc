# users generic .zshrc file for zsh(1)
SCRIPT_DIR="${HOME}/dot.zsh"

. ${SCRIPT_DIR}/path.sh
. ${SCRIPT_DIR}/environment.sh
. ${SCRIPT_DIR}/default.sh
. ${SCRIPT_DIR}/init.sh

# ------------------------------
# Load configuration
# ------------------------------
for conf_path in `find $SCRIPT_DIR/conf.d -name "*.sh"`; do
  . $conf_path
done

# ------------------------------
# Load configuration for platform
# ------------------------------
PLATFORM_SCRIPT_DIR=${SCRIPT_DIR}/platforms/`uname`
if [ -d $PLATFORM_SCRIPT_DIR ];then
  for conf_path in `find $PLATFORM_SCRIPT_DIR/conf.d -name "*.sh"`; do
    . $conf_path
  done
fi

# ------------------------------
# Load Command
# ------------------------------
for conf_path in `find $SCRIPT_DIR/extra -name "*.sh"`; do
  . $conf_path
done

. ${SCRIPT_DIR}/extend.sh
