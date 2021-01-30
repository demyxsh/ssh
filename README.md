# ssh
[![Build Status](https://img.shields.io/travis/demyxco/ssh?style=flat)](https://travis-ci.org/demyxco/ssh)
[![Docker Pulls](https://img.shields.io/docker/pulls/demyx/ssh?style=flat&color=blue)](https://hub.docker.com/r/demyx/ssh)
[![Architecture](https://img.shields.io/badge/linux-amd64-important?style=flat&color=blue)](https://hub.docker.com/r/demyx/ssh)
[![Alpine](https://img.shields.io/badge/alpine-3.13.1-informational?style=flat&color=blue)](https://hub.docker.com/r/demyx/ssh)
[![OpenSSH](https://img.shields.io/badge/openssh-8.4p1-informational?style=flat&color=blue)](https://hub.docker.com/r/demyx/ssh)
[![Buy Me A Coffee](https://img.shields.io/badge/buy_me_coffee-$5-informational?style=flat&color=blue)](https://www.buymeacoffee.com/VXqkQK5tb)
[![Become a Patron!](https://img.shields.io/badge/become%20a%20patron-$5-informational?style=flat&color=blue)](https://www.patreon.com/bePatron?u=23406156)

Non-root Docker image running Alpine Linux and OpenSSH.

DEMYX | NGINX
--- | ---
PORT | 2222
USER | demyx
WORKDIR | /demyx
CONFIG | /etc/demyx
ENTRYPOINT | ["demyx-entrypoint"]
TIMEZONE | America/Los_Angeles

## Usage
```
# Run ssh container first
docker run -d --rm \
--name=ssh \
-v ssh:/home/demyx/.ssh \
--volumes-from=php-container \
-p 2222:2222 \
demyx/ssh

# Copy your authorized_keys to container
docker cp "$HOME"/.ssh/authorized_keys ssh:/home/demyx/.ssh

# Restart ssh container so authorized_keys permissions are set
docker restart ssh
```

## Updates & Support
[![Code Size](https://img.shields.io/github/languages/code-size/demyxco/ssh?style=flat&color=blue)](https://github.com/demyxco/ssh)
[![Repository Size](https://img.shields.io/github/repo-size/demyxco/ssh?style=flat&color=blue)](https://github.com/demyxco/ssh)
[![Watches](https://img.shields.io/github/watchers/demyxco/ssh?style=flat&color=blue)](https://github.com/demyxco/ssh)
[![Stars](https://img.shields.io/github/stars/demyxco/ssh?style=flat&color=blue)](https://github.com/demyxco/ssh)
[![Forks](https://img.shields.io/github/forks/demyxco/ssh?style=flat&color=blue)](https://github.com/demyxco/ssh)

* Auto built weekly on Saturdays (America/Los_Angeles)
* Rolling release updates
* For support: [#demyx](https://webchat.freenode.net/?channel=#demyx)
