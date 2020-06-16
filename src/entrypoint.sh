#!/bin/bash

# Set proper ssh permissions
demyx-permission

# Symlink /demyx
if [[ ! -f /home/demyx/demyx ]]; then
    ln -s /demyx /home/demyx/demyx
fi

/usr/sbin/sshd -D
