#!/bin/bash

<<task
Deploy a Django app
and handel the code for errors
task

code_clone(){
	echo "Cloning the Django app"
	git clone https://github.com/LondheShubham153/django-notes-app.git
}

install_requirements() {
	echo "Instaling dependencies"
	export DEBIAN_FRONTEND=noninteractive
	sudo apt-get update
	sudo apt-get install docker.io nginx -y docker-compose
}

required_restart() {
	sudo chown $USER /var/run/docker.sock
	#sudo systemctl enable docker
	#sudo systemctl enable nginx
	#sudo systemctl restart docker

}

deploy() {
	docker build -t notes-app .
	#docker run -d -p 8000:8000 notes-app:latest
 	docker-compose up -d
}

echo "********** Deployment Started **********"
if ! code_clone; then
	echo "The code directory already exisit"
	cd django-notes-app
fi

if ! install_requirements; then
	echo "Installation Failed"
	exit 1
fi

if ! required_restart; then
	echo "System fault identical"
	exit 1
fi

if ! deploy; then
	echo "Deployment Failed, mailing the admin"
	# sendmail
	exit 1
fi
echo "********** Deployment Done **********"
