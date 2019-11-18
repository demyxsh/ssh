FROM alpine

LABEL sh.demyx.image demyx/ssh
LABEL sh.demyx.maintainer Demyx <info@demyx.sh>
LABEL sh.demyx.url https://demyx.sh
LABEL sh.demyx.github https://github.com/demyxco
LABEL sh.demyx.registry https://hub.docker.com/u/demyx

# Create demyx user
RUN set -ex; \
    addgroup -g 1000 -S demyx; \
    adduser -u 1000 -D -S -G demyx demyx; \
    echo demyx:demyx | chpasswd; \
    mkdir -p /home/demyx/.ssh; \
    chown -R demyx:demyx /home/demyx

# Packages and setup
RUN set -ex; \
    apk add --no-cache --update bash dumb-init openssh; \
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
    mkdir -p /var/www/html; \
    chown demyx:demyx /var/www/html; \
    ln -s /var/www/html /home/demyx

# Copy entrypoint
COPY demyx.sh /usr/local/bin/demyx

# Finalize
RUN set -ex; \
    chmod +x /usr/local/bin/demyx

EXPOSE 2222

USER demyx

ENTRYPOINT ["dumb-init", "demyx"]
