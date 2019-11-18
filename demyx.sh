#!/bin/bash

# Prevents ssh errors from local machine
if [ -f /home/demyx/.ssh/ssh_host_rsa_key ]; then
    cp /home/demyx/.ssh/ssh_host_rsa_key /etc/ssh
    cp /home/demyx/.ssh/ssh_host_rsa_key.pub /etc/ssh
else
    ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
    cp /etc/ssh/ssh_host_rsa_key /home/demyx/.ssh
    cp /etc/ssh/ssh_host_rsa_key.pub /home/demyx/.ssh
fi

# Set proper ssh permissions
if [[ -f /home/demyx/.ssh/authorized_keys ]]; then
    chmod 644 /home/demyx/.ssh/authorized_keys
fi

chmod 700 /home/demyx/.ssh
chmod 600 /etc/ssh/ssh_host_rsa_key

/usr/sbin/sshd -D
