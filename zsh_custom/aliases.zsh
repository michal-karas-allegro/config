# Replace core utils with modern alternatives
alias ls='eza -lh'
alias cat='bat'

# Use nvim instead of vim
alias vi='nvim'
alias vim='nvim'

# Common commands
alias reload='source ~/.zshrc'
alias jirame='jira issue list --assignee $(jira me)'
alias netest='ping 8.8.8.8'
alias hgrep='history -fd 0 | grep'

# Important files
alias zshrc="vim ~/.zshrc"
alias cgit="cd ~/git/"

# Git
alias stash="git stash"
alias pstash="git stash pop"
alias gwa='git worktree add'
alias gwls='git worktree list'
alias gwrm='git worktree remove'
alias gwpr='git worktree prune'
