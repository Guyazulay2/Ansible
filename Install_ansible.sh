#!/bin/bash



while [ "true" == "true" ]
do

echo "
(1) | Install ansible on this computer
(2) | Install ansible on slave
Your Choice :"
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

else
	echo "Enter 1 - 2 only !"
fi

done

