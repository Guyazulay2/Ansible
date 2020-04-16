echo "<< add-repository >> "
sudo apt-add-repository ppa:ansible/ansible

echo "<< Update >>"
sudo apt update

echo "<< Install ansible >>"
sudo apt install ansible

echo "<< Now edit this file and put the ips in it >> type sudo nano /etc/ansible/hosts"

### EOF ###
