#!/bin/sh
set -e


mkdir -p ~/.ssh

# encoded by command:
# cat ~/.ssh/known_hosts | base64 -w0 
echo "${SSH_KNOWN_HOSTS_BASE64}" | base64 -d > ~/.ssh/known_hosts

# encoded by command:
# cat ~/.ssh/id_rsa | gzip | base64 -w0
echo "${SSH_PRIVATE_KEY_GZIP_BASE64}" | base64 -d | gunzip > /root/.ssh/id_rsa && chmod 600 ~/.ssh/id_rsa

ls ~/.ssh/
cat ~/.ssh/known_hosts

exec "$@"