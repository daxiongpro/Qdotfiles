chhosts(){
	sudo chown $USER:$USER /etc/hosts
	# sed -i "/# GitHub520 Host Start/Q" /etc/hosts
	curl https://raw.hellogithub.com/hosts >> /etc/hosts
}
