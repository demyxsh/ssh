FROM alpine

LABEL sh.demyx.image        demyx/ssh
LABEL sh.demyx.maintainer   Demyx <info@demyx.sh>
LABEL sh.demyx.url          https://demyx.sh
LABEL sh.demyx.github       https://github.com/demyxco
LABEL sh.demyx.registry     https://hub.docker.com/u/demyx

# Set default variables
ENV DEMYX                   /demyx
ENV DEMYX_CONFIG            /etc/demyx
ENV DEMYX_LOG               /var/log/demyx
ENV TZ                      America/Los_Angeles
# Support for old variables
ENV SSH_CONFIG              "$DEMYX_CONFIG"
ENV SSH_LOG                 "$DEMYX_LOG"
ENV SSH_ROOT                "$DEMYX"

# Packages and setup
RUN set -ex; \
    apk add --no-cache --update bash openssh sudo tzdata

# Configure Demyx
RUN set -ex; \
    # Create demyx user
    addgroup -g 1000 -S demyx; \
    adduser -u 1000 -D -S -G demyx demyx; \
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
COPY --chown=root:root bin /usr/local/bin

# Finalize
RUN set -ex; \
    # Set up ssh
    sed -i "s|/home/demyx:/sbin/nologin|/home/demyx:/bin/sh|g" /etc/passwd; \
    sed -i "s|#Port 22|Port 2222|g" /etc/ssh/sshd_config; \
    sed -i "s|#PermitRootLogin prohibit-password|PermitRootLogin no|g" /etc/ssh/sshd_config; \
    sed -i "s|#PubkeyAuthentication yes|PubkeyAuthentication yes|g" /etc/ssh/sshd_config; \
    sed -i "s|#PasswordAuthentication yes|PasswordAuthentication no|g" /etc/ssh/sshd_config; \
    sed -i "s|#PermitEmptyPasswords no|PermitEmptyPasswords no|g" /etc/ssh/sshd_config; \
    \
    # Configure sudo
    echo "demyx ALL=(ALL) NOPASSWD:SETENV: /usr/local/bin/demyx-permission" > /etc/sudoers.d/demyx; \
    \
    # Set ownership
    chown -R root:root /usr/local/bin

EXPOSE 2222

USER demyx

ENTRYPOINT ["demyx-entrypoint"]
