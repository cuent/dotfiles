#!/bin/sh

set -e # Exit on error

log() {
  echo "[INFO $(date '+%Y-%m-%d %H:%M:%S')] $1"
}

# Check for required dependencies
check_dependencies() {
  for cmd in curl wget chezmoi; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
      log "Error: $cmd is not installed. Please install it and try again."
      exit 1
    fi
  done
}

check_dependencies

if [ ! "$(command -v chezmoi)" ]; then
  log "chezmoi not found. Installing..."
  bin_dir="$HOME/.local/bin"
  chezmoi="$bin_dir/chezmoi"
  if [ "$(command -v curl)" ]; then
    sh -c "$(curl -fsSL https://git.io/chezmoi)" -- -b "$bin_dir" || {
      log "chezmoi installation failed using curl."
      exit 1
    }
  elif [ "$(command -v wget)" ]; then
    sh -c "$(wget -qO- https://git.io/chezmoi)" -- -b "$bin_dir" || {
      log "chezmoi installation failed using wget."
      exit 1
    }
  else
    log "To install chezmoi, you must have curl or wget installed."
    exit 1
  fi
else
  chezmoi=chezmoi
fi

log "chezmoi installed successfully."

script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"
exec "$chezmoi" init --apply "--source=$script_dir"