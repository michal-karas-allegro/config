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



