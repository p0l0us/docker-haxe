#!/bin/sh
set -e

mkdir -p ~/.ssh

# encode known_hosts using command:
# cat ~/.ssh/known_hosts | gzip | base64 -w0 
echo "${SSH_KNOWN_HOSTS_GZIP_BASE64}" | base64 -d | gunzip > ~/.ssh/known_hosts

# encode id_rsa by command:
# cat ~/.ssh/id_rsa | gzip | base64 -w0
echo "${SSH_PRIVATE_KEY_GZIP_BASE64}" | base64 -d | gunzip > /root/.ssh/id_rsa && chmod 600 ~/.ssh/id_rsa

cat ~/.ssh/known_hosts

exec "$@"