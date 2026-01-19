#!/usr/bin/env bash

# Bash-only interactive niceties
set -o vi

# Rough equivalent of zsh KEYTIMEOUT=1 (reduce escape-delay for vi-mode)
# Readline expects milliseconds.
bind 'set keyseq-timeout 1' 2>/dev/null || true

