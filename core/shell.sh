# Compatibility shim (older installs sourced `core/shell.sh` directly).
# Prefer `core/init.sh`, which dispatches to shell-specific setup.

if [ -n "${ZSH_VERSION:-}" ]; then
  # shellcheck disable=SC1090
  . "$CONFIG_PATH/core/zsh.sh"
elif [ -n "${BASH_VERSION:-}" ]; then
  # shellcheck disable=SC1090
  . "$CONFIG_PATH/core/bash.sh"
fi

