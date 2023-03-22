check_qdot_exists() {
  # initialization for the dotfiles project
  QDOTFILES=~/.Qdotfiles
  if [ ! -d "$QDOTFILES" ]; then
    git clone https://github.com/daxiongpro/Qdotfiles $QDOTFILES
    mkdir -p $QDOTFILES/downloads
  fi
  cd $QDOTFILES
}