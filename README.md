# config-core

Portable, opinionated terminal-shell config that works on **macOS (zsh)** and **Linux (bash)**.

Easily extensible per machine/job due to extension support.

Installs a small managed block into your shell startup file(s) that sets `CONFIG_PATH` and sources `core/init.sh`. The repo then loads core aliases + shell-specific niceties and optionally sources any `extensions/*.sh` files.

## What you get (features)

- **Cross-shell bootstrap**: one entrypoint (`core/init.sh`) that supports bash + zsh
- **Does not overwrite your dotfiles**: appends a managed block to your rc files
- **Git shortcuts**: `st`, `pull`, `push`, `glo`, `gaa`, `cm`, etc.
- **Dev helpers**: `dev`, `rebase_dev`
- **Vim-style line editing**: vi mode in your shell (bash + zsh)
- **Easy customization**: drop extra `.sh` files into `extensions/` (auto-sourced)
- **Quick reload**: `config_reload` to reload this config in the current shell

## Dependencies
With some of the dependencies not met, specific functionalities might not work

- **A POSIX shell** to run the installer (`/bin/sh`)
- **git**
- **vim**
- **lazygit**
- **yazi**

If optional tools are missing, only the related aliases will fail when invoked.

## Install

Clone the repo somewhere permanent (don’t put it in a temp directory), then run the installer from the repo root:

```bash
chmod +x ./env.sh
./env.sh
```

Then restart your terminal, or source your rc file:

```bash
# zsh (macOS)
. ~/.zshrc

# bash (Linux; sometimes macOS Terminal uses this too)
. ~/.bashrc
```

### What `env.sh` changes

It appends this managed block (once) into these files if they exist (or it creates them):

- `~/.zshrc`
- `~/.bashrc`
- `~/.bash_profile`

The block looks like:

```sh
# >>> config-core >>>
export CONFIG_PATH="/absolute/path/to/this/repo"
. "$CONFIG_PATH/core/init.sh"
# <<< config-core <<<
```

## Usage

After install, open a new terminal and try:

- `config` (cd to the repo)
- `st` (git status)
- `lg` (launch lazygit, if installed)
- `dev`, `rebase_dev` (git workflow helpers)
- `config_reload` (reload config in the current shell)

## Extending / customization

To add your own per-machine or per-job customizations, create additional `.sh` files in `extensions/`.
They will be sourced automatically on shell startup.

Example layout:

```text
config-core/
  core/
  extensions/
    work.sh
    aliases.sh
  env.sh
  README.md
```

Tips:
- Keep `extensions/` in a separate private repo if you want to avoid committing personal/work-specific changes here.
- Use guards in extensions if needed (e.g. check for commands before aliasing them).

## Uninstall

Remove the managed block from your rc files:

- `~/.zshrc`
- `~/.bashrc`
- `~/.bash_profile`

Delete everything between (and including) these markers:

- `# >>> config-core >>>`
- `# <<< config-core <<<`

Then restart your terminal (or source your rc file again).

## Troubleshooting

- **Config not loading**: ensure the managed block exists in your rc file and that `CONFIG_PATH` points to the repo root.
- **Aliases/functions not found**: run `config_reload` in the current shell, or start a new terminal session.
- **`lg` fails**: install `lazygit` (or remove the alias from `core/aliases.sh` / your extensions).
