#!/bin/sh

# Prevents ssh errors from local machine
if [ -f /home/www-data/.ssh/ssh_host_rsa_key ]; then
    cp /home/www-data/.ssh/ssh_host_rsa_key /etc/ssh
    cp /home/www-data/.ssh/ssh_host_rsa_key.pub /etc/ssh
else
    ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
    cp /etc/ssh/ssh_host_rsa_key /home/www-data/.ssh
    cp /etc/ssh/ssh_host_rsa_key.pub /home/www-data/.ssh
fi

# Set proper ssh permissions
if [[ -f /home/www-data/.ssh/authorized_keys ]]; then
    chmod 644 /home/www-data/.ssh/authorized_keys
fi
chmod 700 /home/www-data/.ssh
chmod 600 /etc/ssh/ssh_host_rsa_key
chown -R www-data:www-data /home/www-data

/usr/sbin/sshd -D
