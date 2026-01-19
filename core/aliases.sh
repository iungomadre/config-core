# --- Core Configuration Aliases ---
alias aliases="vim \"$CONFIG_PATH/extensions/aliases.sh\" && config_reload"
alias core-aliases="vim \"$CONFIG_PATH/core/aliases.sh\" && config_reload"
alias config='cd $CONFIG_PATH'

# --- Shortcuts ---
alias cl="clear"

# --- Git Aliases ---
alias st="git status"
alias fpush="git push -f"
alias push="git push"
alias pull="git pull"
alias glo="git log --oneline"
alias cm="git commit"
alias gaa="git add ."
alias lg="lazygit"

function dev() {
    git switch main
    git branch -D development 2>/dev/null
    git fetch origin development
    git switch development
}

function rebase_dev() {
    CURRENT_BRANCH=$(git branch --show-current)
    git switch development
    git pull
    git checkout $CURRENT_BRANCH
    git rebase development 
}

