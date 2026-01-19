#!/usr/bin/env sh

# Shared entrypoint for bash/zsh.
# Expects CONFIG_PATH to be set by the bootstrap block in the user's shell rc file.

if [ -z "${CONFIG_PATH:-}" ]; then
  echo "config-core: CONFIG_PATH is not set. Re-run ./env.sh from the repo root." 1>&2
  return 1
fi

# Reload helper used by aliases/functions.
config_reload() {
  # shellcheck disable=SC1090
  . "$CONFIG_PATH/core/init.sh"
}

# Core aliases & functions (portable shell syntax where possible)
# shellcheck disable=SC1090
. "$CONFIG_PATH/core/aliases.sh"

# Shell-specific behavior
if [ -n "${ZSH_VERSION:-}" ]; then
  # shellcheck disable=SC1090
  . "$CONFIG_PATH/core/zsh.sh"
elif [ -n "${BASH_VERSION:-}" ]; then
  # shellcheck disable=SC1090
  . "$CONFIG_PATH/core/bash.sh"
else
  # Fallback (best-effort). Keep `core/shell.sh` as a compatibility shim.
  # shellcheck disable=SC1090
  . "$CONFIG_PATH/core/shell.sh"
fi

# Extensions (portable loop; non-matching globs are safely ignored)
for extension_file in "$CONFIG_PATH/extensions/"*.sh; do
  [ -f "$extension_file" ] || continue
  # shellcheck disable=SC1090
  . "$extension_file"
done

