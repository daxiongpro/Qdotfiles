cp_file_if_exists() {
  if [ -f "$1" -a -e $2 ]; then
    cp "$1" "$2"
    echo "copy successed: $1"
  elif [ -d "$1" -a -d $2 ]; then
    cp -r "$1" "$2"
    echo "copy successed: $1"
  elif [ ! -e "$1" ]; then
    echo "souce error--------No such file or directory: $1"
  elif [ ! -e "$2" ]; then
    echo "destination error--------No such file or directory: $2"
  else
    echo "error"
  fi
}


sudo_cp_file_if_exists() {
  if [ -f "$1" -a -e $2 ]; then
    sudo cp "$1" "$2"
  fi
}


