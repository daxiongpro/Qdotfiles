source_if_exists() {
  file="$1"

  if [ -f "$file" ]; then
    source "$file"
  fi
}