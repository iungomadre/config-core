# Programming env configuration core

A script that sets up an opinionated coding development using vim gestures, custom git aliases etc

Configures your local zsh by **overwriting zshrc**

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

## Running (post-configuration)

	chmod +x 
	./env.sh
