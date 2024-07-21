#!/bin/bash
#
##Deploy App

code_clone(){
	echo "Cloning Code"
	git clone <need to put the git details>
}

install_req(){
	echo "Install all Dependencies"
	#sudo apt-get update -y
	sudo apt-get install docker.io nginx -y docker-compose
}

req_restart(){
	sudo chown $USER /var/run/docker.sock
	sudo systemctl enable docker
	sudo systemctl enable nginx
	sudo systemctl restart docker
}

deploy(){
	docker build -t notes-app .
	docker run -d -p 8000:8000 notes-app:latest
	#docker-compose up -d
}

echo "--------Deploy Start-----------"
if ! code_clone; then
	echo "code directory already exist"
	cd django-notes-app
fi
if ! install_req; then
	echo "Installation failed"
	exit 1
fi
if ! req_restart; then
	echo "System  fault"
	exit 1
fi
if ! deploy; then
	echo "Deployment failed"
	exit 1
fi
echo "--------Deploy Done------------"

