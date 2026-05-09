FROM debian:stable-slim

LABEL sh.demyx.image        demyx/ssh
LABEL sh.demyx.maintainer   Demyx <info@demyx.sh>
LABEL sh.demyx.url          https://demyx.sh
LABEL sh.demyx.github       https://github.com/demyxsh
LABEL sh.demyx.registry     https://hub.docker.com/u/demyx

# Set default variables
ENV DEMYX                   /demyx
ENV DEMYX_CONFIG            /etc/demyx
ENV DEMYX_LOG               /var/log/demyx
ENV DEMYX_PASSWORD          demyx
ENV DEMYX_USERNAME          demyx
ENV TZ                      America/Los_Angeles
# Support for old variables
ENV SSH_CONFIG              "$DEMYX_CONFIG"
ENV SSH_LOG                 "$DEMYX_LOG"
ENV SSH_ROOT                "$DEMYX"

# Packages and setup
RUN set -ex; \
    apt update; \
    apt install -y bash curl git htop nano openssh-client openssh-server sudo tzdata

# Configure Demyx
RUN set -ex; \
    # Create demyx user
    groupadd -g 1000 demyx; \
    useradd -u 1000 -g demyx -m -s /bin/bash demyx; \
    \
    # Create demyx directories
    install -d -m 0755 -o demyx -g demyx "$DEMYX"; \
    install -d -m 0755 -o demyx -g demyx "$DEMYX_CONFIG"; \
    install -d -m 0755 -o demyx -g demyx "$DEMYX_LOG"; \
    \
    # Update .bashrc
    echo 'PS1="$(whoami)@\h:\w \$ "' > /home/demyx/.bashrc; \
    echo 'PS1="$(whoami)@\h:\w \$ "' > /root/.bashrc

# Imports
COPY bin /usr/local/bin

# Finalize
RUN set -ex; \
    # Set up ssh
    sed -i "s|/home/demyx:/sbin/nologin|/home/demyx:/bin/bash|g" /etc/passwd; \
    sed -i "s|#Port 22|Port 2222|g" /etc/ssh/sshd_config; \
    sed -i "s|#PermitRootLogin prohibit-password|PermitRootLogin no|g" /etc/ssh/sshd_config; \
    sed -i "s|#PubkeyAuthentication.*|PubkeyAuthentication no|g" /etc/ssh/sshd_config; \
    sed -i "s|#PasswordAuthentication.*|PasswordAuthentication yes|g" /etc/ssh/sshd_config; \
    sed -i "s|#PermitEmptyPasswords.*|PermitEmptyPasswords no|g" /etc/ssh/sshd_config; \
    sed -i "s|#LoginGraceTime 2m|LoginGraceTime 30|g" /etc/ssh/sshd_config; \
    sed -i "s|#MaxAuthTries 6|MaxAuthTries 3|g" /etc/ssh/sshd_config; \
    sed -i "s|#MaxSessions 10|MaxSessions 3|g" /etc/ssh/sshd_config; \
    sed -i "s|#X11Forwarding yes|X11Forwarding no|g" /etc/ssh/sshd_config; \
    sed -i "s|#AllowTcpForwarding yes|AllowTcpForwarding local|g" /etc/ssh/sshd_config; \
    sed -i "s|#PermitUserEnvironment no|PermitUserEnvironment no|g" /etc/ssh/sshd_config; \
    sed -i "s|#ClientAliveInterval 0|ClientAliveInterval 300|g" /etc/ssh/sshd_config; \
    sed -i "s|#ClientAliveCountMax 3|ClientAliveCountMax 0|g" /etc/ssh/sshd_config; \
    \
    # Configure sudo
    echo "demyx ALL=(ALL) NOPASSWD:SETENV: /usr/local/bin/demyx-sudo" > /etc/sudoers.d/demyx; \
    \
    # Set ownership
    chown -R root:root /usr/local/bin

EXPOSE 2222

USER demyx

WORKDIR /home/demyx

ENTRYPOINT ["demyx-entrypoint"]
