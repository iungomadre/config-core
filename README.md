# Programming env configuration core

A script that sets up an opinionated coding development using vim gestures, custom git aliases etc

Configures your local shell by **appending a managed block** to your rc file(s) (`~/.zshrc`, `~/.bashrc`, `~/.bash_profile`).

Core project that can be extended per job, since there's different aliases in different workspaces

## Extending (optional)

To extend the project with custom scripts, create sh files that can be sourced in the `/extensions` directory

Example:
```
/root/
    README.md
    env.md
    core/
        ...
    extensions/
        /custom_source1.sh
        /custom_source2.sh
```

Additionally, you can create `.gitignore` file to exclude `extensions` directory and commit its content to a different repo

## Running (post-configuration)

	chmod +x 
	./env.sh
