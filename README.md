# ssh
[![demyxsh/ssh](https://github.com/demyxsh/ssh/actions/workflows/main.yml/badge.svg)](https://github.com/demyxsh/ssh/actions/workflows/main.yml)
[![Code Size](https://img.shields.io/github/languages/code-size/demyxsh/ssh?style=flat&color=blue)](https://github.com/demyxsh/ssh)
[![Repository Size](https://img.shields.io/github/repo-size/demyxsh/ssh?style=flat&color=blue)](https://github.com/demyxsh/ssh)
[![Watches](https://img.shields.io/github/watchers/demyxsh/ssh?style=flat&color=blue)](https://github.com/demyxsh/ssh)
[![Stars](https://img.shields.io/github/stars/demyxsh/ssh?style=flat&color=blue)](https://github.com/demyxsh/ssh)
[![Forks](https://img.shields.io/github/forks/demyxsh/ssh?style=flat&color=blue)](https://github.com/demyxsh/ssh)
[![Docker Pulls](https://img.shields.io/docker/pulls/demyx/ssh?style=flat&color=blue)](https://hub.docker.com/r/demyx/ssh)
[![Architecture](https://img.shields.io/badge/linux-amd64-important?style=flat&color=blue)](https://hub.docker.com/r/demyx/ssh)
[![Alpine](https://img.shields.io/badge/dynamic/json?url=https://github.com/demyxsh/ssh/raw/master/version.json&label=alpine&query=$.alpine&color=blue)](https://hub.docker.com/r/demyx/ssh)
[![OpenSSH](https://img.shields.io/badge/dynamic/json?url=https://github.com/demyxsh/ssh/raw/master/version.json&label=ssh&query=$.ssh&color=blue)](https://hub.docker.com/r/demyx/ssh)
[![Buy Me A Coffee](https://img.shields.io/badge/buy_me_coffee-$5-informational?style=flat&color=blue)](https://www.buymeacoffee.com/VXqkQK5tb)
[![Become a Patron!](https://img.shields.io/badge/become%20a%20patron-$5-informational?style=flat&color=blue)](https://www.patreon.com/bePatron?u=23406156)

Non-root Docker image running Alpine Linux and OpenSSH.

DEMYX | SSH
--- | ---
PORT | 2222
USER | demyx
WORKDIR | /demyx
CONFIG | /etc/demyx
ENTRYPOINT | ["demyx-entrypoint"]
TIMEZONE | America/Los_Angeles

## NOTICE
This repository has been moved to the organization [demyxsh](https://github.com/demyxsh); please update the remote URL.
```
git remote set-url origin git@github.com:demyxsh/ssh.git
```

## Usage
Password login is enabled by default. Set `DEMYX_PASSWORD` to false to disable password login.

```
# Run ssh container first
docker run -d --rm \
--name=ssh \
-v ssh:/home \
--volumes-from=php-container \
-p 2222:2222 \
-e DEMYX=/demyx \
-e DEMYX_CONFIG=/etc/demyx \
-e DEMYX_LOG=/var/log/demyx \
-e DEMYX_USERNAME=demyx \
-e DEMYX_PASSWORD=demyx \
-e TZ=America/Los_Angeles \
demyx/ssh

# Copy your authorized_keys to container
docker cp "$HOME"/.ssh/authorized_keys ssh:/home/demyx/.ssh

# Restart ssh container so authorized_keys permissions are set
docker restart ssh
```

## Updates & Support
* Auto built weekly on Saturdays (America/Los_Angeles)
* Rolling release updates
* For support: [#demyx](https://web.libera.chat/?channel=#demyx)
