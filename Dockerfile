FROM alpine

LABEL sh.demyx.image        demyx/ssh
LABEL sh.demyx.maintainer   Demyx <info@demyx.sh>
LABEL sh.demyx.url          https://demyx.sh
LABEL sh.demyx.github       https://github.com/demyxco
LABEL sh.demyx.registry     https://hub.docker.com/u/demyx

# Set default variables
ENV SSH_ROOT    /demyx
ENV SSH_CONFIG  /etc/demyx
ENV SSH_LOG     /var/log/demyx
ENV TZ          America/Los_Angeles

# Configure Demyx
RUN set -ex; \
    addgroup -g 1000 -S demyx; \
    adduser -u 1000 -D -S -G demyx demyx; \
    echo demyx:demyx | chpasswd; \
    \
    install -d -m 0755 -o demyx -g demyx "$SSH_ROOT"; \
    install -d -m 0755 -o demyx -g demyx "$SSH_CONFIG"; \
    install -d -m 0755 -o demyx -g demyx "$SSH_LOG"; \
    install -d -m 0755 -o demyx -g demyx /home/demyx/.ssh

# Packages and setup
RUN set -ex; \
    apk add --no-cache --update bash dumb-init openssh tzdata; \
    # Set up ssh
    sed -i "s|/home/demyx:/sbin/nologin|/home/demyx:/bin/sh|g" /etc/passwd; \
    sed -i "s|#Port 22|Port 2222|g" /etc/ssh/sshd_config; \
    sed -i "s|#PermitRootLogin prohibit-password|PermitRootLogin no|g" /etc/ssh/sshd_config; \
    sed -i "s|#PubkeyAuthentication yes|PubkeyAuthentication yes|g" /etc/ssh/sshd_config; \
    sed -i "s|#PasswordAuthentication yes|PasswordAuthentication no|g" /etc/ssh/sshd_config; \
    sed -i "s|#PermitEmptyPasswords no|PermitEmptyPasswords no|g" /etc/ssh/sshd_config; \
    \
    chown demyx:demyx /etc/ssh; \
    \
    ln -s "$SSH_ROOT" /home/demyx

# Copy source
COPY --chown=demyx:demyx src "$SSH_CONFIG"

# Finalize
RUN set -ex; \
    chmod +x /usr/local/bin/demyx

EXPOSE 2222

USER demyx

ENTRYPOINT ["dumb-init", "demyx"]
