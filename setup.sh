#!/bin/bash

set -e

dotfiles_path=$(realpath --relative-to $HOME "$(dirname "$0")")
self_name="$(basename "$0")"

cd $HOME

find $dotfiles_path -type f \
  ! -path '*/.git/*' \
  ! -path "*/$self_name" \
  ! -path "*/README.md" \
  -print0 | while read -d $'\0' file
do
  target="$(echo "$file" | sed "s~^$dotfiles_path/~~")"
  target_dir="$(dirname "$target")"
  
  # Create target dir if needed
  mkdir -p "$target_dir"

  # Backup iff target file is not a symlink
  if [ -f "$target" ] && [ ! -L "$target" ]; then
    echo -e "backup: \e[33m$target\e[0m"
    cp "$target" "$target~"
  fi

  # create symlink
  echo -e "symlink: \e[32m$target\e[0m"
  ln -sf $file $target
done
