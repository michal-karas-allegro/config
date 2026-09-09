function chb() {
  local main_branch=$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')
  main_branch=${main_branch:-"master"} 

  git checkout "$main_branch" && \
  git pull origin "$main_branch" --rebase && \
  git checkout -b "$1"
}

function bat() {
    if [ $# -eq 0 ]; then
        echo "Error: No file specified. 'bat' requires an argument."
        return 1
    fi
    command bat "$@"
}

function nvm_prompt_info() {
  echo ""
}

function git-relocate() {
    if [ "$#" -ne 3 ]; then
        echo "Error: Missing arguments."
        echo "Usage:  git-relocate <branch-to-move> <old-parent> <new-parent>"
        echo "Example: git-relocate feature-x master develop"
        return 1
    fi

    local branch=$1
    local old_parent=$2
    local new_parent=$3

    echo "Relocating $branch from $old_parent onto $new_parent..."
    
    git rebase --onto "$new_parent" "$old_parent" "$branch"
}


function gitpushorigin() {
  if [ "$#" -ne 1 ]; then
    echo "Erorr: Missing arguments."
    echo "Usage: gitpushorigin <branch>"
    echo "Example: gitpushorigin branch-123"
  fi

  local branch=$1

  echo "Pushing to origin $branch"
  git push origin "$branch"
}

function gwrmf() {
  local target
  target=$(git worktree list | fzf | awk '{print $1}')
  if [[ -n "$target" ]]; then
    git worktree remove "$target"
  fi
}

function gwan() {
  local branch=$1
  local base=${2:-main}
  local dir_name=$(echo "$branch" | tr '/' '-')

  git worktree add -b "$branch" "../.worktrees/$dir_name" "$base" && cd "../.worktrees/$dir_name"
}

function fenv() {
  local env_var
  env_var=$(printenv | fzf --header="Type to filter env vars...")
  if [[ -n "$env_var" ]]; then
    echo "$env_var"
  fi
}
