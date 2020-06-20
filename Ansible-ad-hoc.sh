#!/bin/bash

while [ "true" == "true" ]
do
echo "
(1) | Install ansible on this computer
(2) | Install ansible on slave
(3) | Installation of services
(4) | Copy file to client
(5) | Install dcoker and pull images
(6) | Entering customer details
(7) | Create user to clients
(Your Choice >>:"
read i

if [ $i == "1" ]; then
	sudo apt-get install software-properties-common -y
	sudo apt-add-repository ppa:ansible/ansibl -y
	sudo apt update -y
	sudo apt install ansible -y
	sudo apt-get install python3-pip -y


elif [ $i == "2" ]; then
	echo "Enter the slave IP :"
	read IP
	echo "Enter the Password :"
	read PASS
	sshpass -p 'rootroot' ssh root@$IP 'sudo apt-get install software-properties-common -y \\
	sudo apt-add-repository ppa:ansible/ansibl -y \\
	sudo apt update -y \\
	sudo apt install ansible -y \\
	sudo apt-get install python3-pip -y '


elif [ $i == "3" ]; then
	echo "Which group would you like to execute? >:"
	read G
	echo "Enter the Module that you want ( apt or yum )>:"
	read M
	echo "Enter The package that you want to install >:"
	read P
	ansible $G -b -m $M -a 'name='$P' state=latest'
	ansible $G -b -m service -a 'name='$P' enabled=true'


elif [ $i == "4" ]; then
	echo "Which group would you like to execute? >:"
	read G
	echo "Enter the file that you want to copy ( full path ) >:"
	read FILE
	echo "Enter the destination >:"
	read DEST
	ansible $G -m copy -a 'src='$FILE' dest='$DEST''


elif [ $i == "5" ]; then
	echo "Enter the image that you want to pull :"
	read PULL
	ansible all -m -b command -a "apt-get install 'docker-py>=1.7.0'"
	ansible all -m -b command -a 'sudo docker pull '$PULL''

elif [ $i == "6" ]; then
	echo "Your Full Name :"
	read NAME
	echo "Your Age :"
	read AGE
	echo "Your Adress :"
	read ADD
	touch details.txt 
	echo "Full Name :" $NAME > details.txt
	echo "Age :"  $AGE >> details.txt
	echo "Adress :" $ADD >> details.txt

	echo "Which group would you like to execute? >:"
	read G
	echo "Enter the file that you want to copy ( Full path ) >:"
	read FILE
  	echo "Enter the destination (Full path )>:"
	read DEST
	ansible $G -m copy -a 'src='$FILE' dest='$DEST''


elif [ $i == "7" ]; then
	echo "Do you want to | (1) create user (2) delete user >:"
	read CHOICE
	if [ $CHOICE == "1" ]; then
		echo "Which group would you like to execute? >:"
		read G
		echo "Enter the new user >:"
		read U
		echo "Enter the password  >:"
		read P
		ansible $G -m user -a "name='$U' password='$P'"
	elif [ $CHOICE == "2" ]; then
		echo "Which group would you like to execute? >:"
		read G
		echo "Enter the user that you want to delete  >:"
		read U
		ansible G -m user -a "name='$U' state=absent"
		
else
	echo "Enter 1 - 7 only !"

done
fi

