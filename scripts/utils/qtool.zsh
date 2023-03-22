#!/bin/bash
qtool(){
  if [ "$1" = "ip" ];then
    ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | grep -Ev '172.*.0.1'
  elif [ "$1" = "hs" ];then
	shift
	hserver $@
  else
    echo "Usage:"
    echo "  qtool [ip|ps]"
  fi
}

hserver(){
	port=${1-8080}
	ip=`qtool ip`
	python -m http.server $port --bind ${ip}
}


