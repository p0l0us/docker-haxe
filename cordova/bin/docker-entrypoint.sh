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

# required by D3 deployemnt.

if [ -n "${AWS_MOUNT_PATH}" ] && [ -n "${AWS_MOUNT_USERNAME}" ] && [ -n "${AWS_MOUNT_PASSWORD}" ]
then
	if bash -c "mount -t cifs '${AWS_MOUNT_PATH}' /mnt/aws-iis -o  username=${AWS_MOUNT_USERNAME},password=${AWS_MOUNT_PASSWORD},sec=ntlmssp,rw,uid=0,gid=0,noperm"; then
		echo "Mounted ntlssp"
	else
		bash -c "mount -t cifs '${AWS_MOUNT_PATH}' /mnt/aws-iis -o  username=${AWS_MOUNT_USERNAME},password=${AWS_MOUNT_PASSWORD},sec=ntlm,rw,uid=0,gid=0,noperm"
	fi
	
	ls /mnt/aws-iis
fi

# Get Android Certificate file from S3
if [ -n "${BUCKET_PATH}" ] && [ -n "${RELEASE_ENV}" ]
then
	aws s3 cp ${BUCKET_PATH} /temp/cert/DAZN/android.keystore.jks-${RELEASE_ENV} --recursive
fi

exec "$@"
