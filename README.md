# Ansible-ubuntu


# Step 1 
    Installing Ansible,
    go to my repository and pull the "install.sh" script.
    
    
# Step 2 
    Setting Up the Inventory File,
    sudo nano /etc/ansible/hosts  #### add here your servers.
    
    
# Step 3
    Testing Connection,
    ansible all -m ping -u root #### show you if server SUCCESS and false.
    

# Step 4 
    Key exchange,
    ssh-keygen -t rsa ### create the keygen
    ssh-copy-id [Server - IP] ### exchange
    
show the hosts :

    ansible --list-host all 
    
Checking the hosts :

    ansible all -m ping

to run a playbook :

    ansible-playbook -i hosts [file name.yml]
    
running you playbook little -k for ssh password, big -K for sudo password : 

    ansible-playbook -i hosts playbook.yml -k -K
    
Setting up passwordless sudo

    nano /etc/sudoer

add line at the end of the file and replace 'guy' with your user :

    guy ALL=(ALL) NOPASSWD:ALL
    
    
    
Disable host key checking :
    
    (1) sudo nano ansible.cfg
    (2) allow host_key_checking = False
    
    
    
    
### EOF ### 
