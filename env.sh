#!/usr/bin/env sh

set -eu

echo "Starting config-core setup..."

CONFIG_PATH="$(pwd)"

append_block_if_missing() {
  rc_file="$1"

  # Ensure file exists
  if [ ! -f "$rc_file" ]; then
    : >"$rc_file"
  fi

  if grep -q ">>> config-core >>>" "$rc_file" 2>/dev/null; then
    echo "Already configured: $rc_file"
    return 0
  fi

  # Add a leading newline if the file isn't empty
  if [ -s "$rc_file" ]; then
    printf "\n" >>"$rc_file"
  fi

  cat >>"$rc_file" <<EOF
# >>> config-core >>>
export CONFIG_PATH="${CONFIG_PATH}"
. "\$CONFIG_PATH/core/init.sh"
# <<< config-core <<<
EOF

  echo "Installed config-core block into: $rc_file"
}

append_block_if_missing "$HOME/.zshrc"
append_block_if_missing "$HOME/.bashrc"
append_block_if_missing "$HOME/.bash_profile"

echo "Done. Restart your terminal, or run:"
echo "  . \"$HOME/.zshrc\"   # zsh"
echo "  . \"$HOME/.bashrc\"  # bash"

