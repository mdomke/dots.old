
link_files() {
  local source=$1 target=$2;
  for file in $(find `pwd`/$source -type f); do
    echo "$file => $target"
    ln -s "$file" "$target"
  done
}

link_files "zsh/after" ~/.zsh.after/
link_files "zsh/prompts" ~/.zsh.prompts/
