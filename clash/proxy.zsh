function _access_url()
{
	1=${1:-google}

	start=$SECONDS
	result=$(curl -m 3 -I --silent www.$1.com | head -n 1 | awk -F' ' '{print $2}')
	result=${result:-None}
	dur=$(( SECONDS - start ))

	if [ $result = "200" ];then
		printf "[%.2f s] %-6s:200 OK✅\n" $dur $1
	else
		printf "[%.2f s] %-6s:${result}🚫\n" $dur $1
	fi
}

function cg(){
	_access_url baidu 
	_access_url google 
}
function _proxy_help(){
cat << EOF
Usage: proxy [on|off|status]
Command:
 - on/off: set http/https proxy port
 - status: see if you can use google and baidu
EOF
}
function proxy(){
	MAC_PROXY_PORT=1087
	LINUX_PROXY_PORT=8999
	PROXY_IP=127.0.0.1
	if test "$(uname)" = "Darwin";then
		PROXY_PORT=$MAC_PROXY_PORT
	elif test "$(expr substr $(uname -s) 1 5)" = "Linux";then
		PROXY_PORT=$LINUX_PROXY_PORT
	fi

	if [ "$1" = "on" ]; then
		case $2 in 
		m*|mac)
			PROXY_PORT=$MAC_PROXY_PORT ;;
		l*|linux)
			PROXY_PORT=$LINUX_PROXY_PORT ;;
		*)
			PROXY_PORT=${2:-${PROXY_PORT}}
			;;
		esac
		export http_proxy="$PROXY_IP:$PROXY_PORT"
		export https_proxy="$PROXY_IP:$PROXY_PORT"
		# docker pull proxy needs this
		# https://docs.docker.com/config/daemon/systemd/#httphttps-proxy
		export HTTP_PROXY="$PROXY_IP:$PROXY_PORT"
		export HTTPS_PROXY="$PROXY_IP:$PROXY_PORT"
	elif [ "$1" = "off" ]; then
		export http_proxy=""
		export https_proxy=""
		export HTTP_PROXY=""
		export HTTPS_PROXY=""

	elif [ "$1" = "status" ]; then
		echo "--------------"
		echo "Proxy setting"
		echo "--------------"
		echo http_proxy="${http_proxy}"
		echo https_proxy="${https_proxy}"
		echo HTTP_PROXY="${HTTP_PROXY}"
		echo HTTPS_PROXY="${HTTPS_PROXY}"
		echo "--------------"
		echo "Network test"
		echo "--------------"
		cg
	elif [ "$1" = "up" ]; then
		cd ~/clash
		clash -d ~/clash
	
	else
		_proxy_help
	fi
}
