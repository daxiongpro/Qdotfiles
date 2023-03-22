cp_file_if_exists() {
  if [ -f "$1" -a -e $2 ]; then
    cp "$1" "$2"
  elif [ -d "$1" -a -d $2 ]; then
    cp -r "$1" "$2"
  fi
}


sudo_cp_file_if_exists() {
  if [ -f "$1" -a -e $2 ]; then
    sudo cp "$1" "$2"
  fi
}

cp_file_if_exists() {
  if [ -f "$1" -a -e $2 ]; then
    cp "$1" "$2"
  fi
}


