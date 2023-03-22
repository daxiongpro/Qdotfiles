setup_color() {
  # Only use colors if connected to a terminal
  if [ -t 1 ]; then
    RED=$(printf '\033[31m')
    GREEN=$(printf '\033[32m')
    YELLOW=$(printf '\033[33m')
    BLUE=$(printf '\033[34m')
    BOLD=$(printf '\033[1m')
    RESET=$(printf '\033[m')
  else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    BOLD=""
    RESET=""
  fi
}

greeting() {
  setup_color
  printf "$GREEN"
  cat <<-'EOF'
 __________________________________
/          daxiongpro               \
| Hello, Welcome to use Qdotfiles!  |
| Useful tools:                     |
|   qdot -h                         | 
|   proxy -h                        |
\   qtool -h                        /
 ----------------------------------
                    _ooOoo_  
                   o8888888o  
                   88" . "88  
                   (| -_- |)  
                    O\ = /O  
                ____/`---'\____  
              .   ' \\| |// `.  
               / \\||| : |||// \  
             / _||||| -:- |||||- \  
               | | \\\ - /// | |  
             | \_| ''\---/'' | |  
              \ .-\__ `-` ___/-. /  
           ___`. .' /--.--\ `. . __  
        ."" '< `.___\_<|>_/___.' >'"".  
       | | : `- \`.;`\ _ /`;.`/ - ` : | |  
         \ \ `-. \_ __\ /__ _/ .-` / /  
 ======`-.____`-.___\_____/___.-`____.-'======  
                    `=---='  
 
 .............................................  

EOF
  printf "$RESET"
}