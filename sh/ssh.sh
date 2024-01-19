#!/bin/bash

if [ ! -e ~/.ssh/ ]; then

ssh-keygen -t rsa

fi

cat ~/authorized_keys >> ~/.ssh/authorized_keys


sed -i -r 's/^(PasswordAuthentication)\s+(yes|no)/\1 no/g' /etc/ssh/sshd_config
sed -i -r 's/(PubkeyAuthentication)\s+(yes|no)/\1 yes/g' /etc/ssh/sshd_config

str=`cat /etc/ssh/sshd_config`

if [[ ! $str =~ ^PubkeyAuthentication ]]; then
     echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config
fi

systemctl restart sshd
firewall-cmd --add-port=22/tcp --permanent
firewall-cmd --reload
rm -f ~/authorized_keys
rm -f ssh.sh