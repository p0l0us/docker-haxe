#!/bin/sh
set -e

mkdir -p ~/.ssh

# encode known_hosts using command:
# cat ~/.ssh/known_hosts | gzip | base64 -w0 
if [ -n "${SSH_KNOWN_HOSTS_GZIP_BASE64}" ]
then
	echo "${SSH_KNOWN_HOSTS_GZIP_BASE64}" | base64 -d | gunzip > ~/.ssh/known_hosts
fi

# encode id_rsa by command:
# cat ~/.ssh/id_rsa | gzip | base64 -w0
if [ -n "${SSH_PRIVATE_KEY_GZIP_BASE64}" ]
then
	echo "${SSH_PRIVATE_KEY_GZIP_BASE64}" | base64 -d | gunzip > /root/.ssh/id_rsa && chmod 600 ~/.ssh/id_rsa
fi

if [ -n "${SSH_PRIVATE_KEY_GZIP_BASE64}" ] && [ -n "${SSH_KNOWN_HOSTS_GZIP_BASE64}" ]
then
	npm install -g git+ssh://git@stash.massiveinteractive.com:7999/mdk/mdk-cli-node
fi

exec "$@"