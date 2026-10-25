#!/bin/bash
set -euo pipefail

# Use this checkout's location, so the script works from any directory.
repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
ghostty_source="$repo_dir/ghostty/config"
nvim_source="$repo_dir/nvim"
ghostty_destination="$HOME/Library/Application Support/com.mitchellh.ghostty/config"
nvim_destination="$HOME/.config/nvim"

fail() {
  printf 'Error: %s\n' "$1" >&2
  exit 1
}

check_destination() {
  local destination="$1"

  if [[ -e "$destination" && ! -L "$destination" ]]; then
    fail "Refusing to replace $destination. Move it aside and rerun."
  fi
}

link_config() {
  local source="$1"
  local destination="$2"

  if [[ -L "$destination" && "$destination" -ef "$source" ]]; then
    printf 'Already linked: %s -> %s\n' "$destination" "$source"
    return
  fi

  mkdir -p "$(dirname "$destination")"
  ln -sfn "$source" "$destination"
  printf 'Linked: %s -> %s\n' "$destination" "$source"
}

# Check both sources and destinations before changing either link.
if [[ ! -f "$ghostty_source" ]]; then
  fail "Ghostty config is missing: $ghostty_source"
fi
if [[ ! -d "$nvim_source" ]]; then
  fail "Neovim config directory is missing: $nvim_source"
fi
check_destination "$ghostty_destination"
check_destination "$nvim_destination"

link_config "$ghostty_source" "$ghostty_destination"
link_config "$nvim_source" "$nvim_destination"
