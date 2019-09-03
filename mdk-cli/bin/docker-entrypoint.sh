#!/bin/sh
set -e

mkdir -p ~/.ssh/

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

# Expected params for mounting aws-iis
# ${AWS_MOUNT_PATH} - samba share path
# ${AWS_MOUNT_USERNAME} - samba share username
# ${AWS_MOUNT_PASSWORD} - samba share password

if [ -z "${SSH_PRIVATE_KEY_GZIP_BASE64}" ]
then
	echo "mount -t cifs '${AWS_MOUNT_PATH}' /mnt/aws-iis -o username=${AWS_MOUNT_USERNAME},password=${AWS_MOUNT_PASSWORD},sec=ntlm,rw,uid=0,gid=0,noperm"
	bash -c "mount -t cifs '${AWS_MOUNT_PATH}' /mnt/aws-iis -o  username=${AWS_MOUNT_USERNAME},password=${AWS_MOUNT_PASSWORD},sec=ntlm,rw,uid=0,gid=0,noperm"
	ls /mnt/aws-iis
fi

exec "$@"