# ssh
[![Build Status](https://img.shields.io/travis/demyxco/ssh?style=flat)](https://travis-ci.org/demyxco/ssh)
[![Docker Pulls](https://img.shields.io/docker/pulls/demyx/ssh?style=flat&color=blue)](https://hub.docker.com/r/demyx/ssh)
[![Architecture](https://img.shields.io/badge/linux-amd64-important?style=flat&color=blue)](https://hub.docker.com/r/demyx/ssh)
[![Alpine](https://img.shields.io/badge/alpine-3.10.3-informational?style=flat&color=blue)](https://hub.docker.com/r/demyx/ssh)
[![OpenSSH](https://img.shields.io/badge/openssh-8.1p1-informational?style=flat&color=blue)](https://hub.docker.com/r/demyx/ssh)
[![Buy Me A Coffee](https://img.shields.io/badge/buy_me_coffee-$5-informational?style=flat&color=blue)](https://www.buymeacoffee.com/VXqkQK5tb)

OpenSSH is a suite of security-related network-level utilities based on the Secure Shell protocol, which help to secure network communications via the encryption of network traffic over multiple authentication methods and by providing secure tunneling capabilities.

Used for [github.com/demyxco](https://github.com/demyxco/demyx) to allow SFTP to WordPress containers in development mode. This image has created a user `demyx` with the password `demyx`, disabled PermitEmptyPasswords, and disabled root login. 

TITLE | DESCRIPTION
--- | ---
USER<br />GROUP | demyx (1000)<br />demyx (1000)
SSH PORT | 2222

## Updates & Support
[![Code Size](https://img.shields.io/github/languages/code-size/demyxco/ssh?style=flat&color=blue)](https://github.com/demyxco/ssh)
[![Repository Size](https://img.shields.io/github/repo-size/demyxco/ssh?style=flat&color=blue)](https://github.com/demyxco/ssh)
[![Watches](https://img.shields.io/github/watchers/demyxco/ssh?style=flat&color=blue)](https://github.com/demyxco/ssh)
[![Stars](https://img.shields.io/github/stars/demyxco/ssh?style=flat&color=blue)](https://github.com/demyxco/ssh)
[![Forks](https://img.shields.io/github/forks/demyxco/ssh?style=flat&color=blue)](https://github.com/demyxco/ssh)

* Auto built weekly on Sundays (America/Los_Angeles)
* Rolling release updates
* For support: [#demyx](https://webchat.freenode.net/?channel=#demyx)

## Usage
```
# Run ssh container first
docker run -d --rm \
--name ssh \
-v ssh:/home/demyx/.ssh \
--volumes-from php-container \
-p 2222:2222 \
demyx/ssh

# Copy your authorized_keys to container
docker cp "$HOME"/.ssh/authorized_keys ssh:/home/demyx/.ssh

# Restart ssh container so authorized_keys permissions are set
docker restart ssh
```
