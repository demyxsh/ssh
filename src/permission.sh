#!/bin/bash

# Prevents ssh errors from local machine
if [[ -f /home/demyx/.ssh/ssh_host_rsa_key ]]; then
    [[ ! -f /etc/ssh/ssh_host_rsa_key ]] && cp /home/demyx/.ssh/ssh_host_rsa_key /etc/ssh
    [[ ! -f /etc/ssh/ssh_host_rsa_key.pub ]] && cp /home/demyx/.ssh/ssh_host_rsa_key.pub /etc/ssh
else
    [[ ! -f /etc/ssh/ssh_host_rsa_key ]] && ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
    [[ ! -f /home/demyx/.ssh/ssh_host_rsa_key ]] && cp /etc/ssh/ssh_host_rsa_key /home/demyx/.ssh
    [[ ! -f /home/demyx/.ssh/ssh_host_rsa_key.pub ]] && cp /etc/ssh/ssh_host_rsa_key.pub /home/demyx/.ssh
fi

if [[ -f /home/demyx/.ssh/authorized_keys ]]; then
    chmod 644 /home/demyx/.ssh/authorized_keys
fi

chmod 700 /home/demyx/.ssh
chmod 600 /etc/ssh/ssh_host_rsa_key
chown demyx:demyx /etc/ssh/ssh_host_rsa_key
chown demyx:demyx /etc/ssh/ssh_host_rsa_key.pub
chown -R demyx:demyx /home/demyx
