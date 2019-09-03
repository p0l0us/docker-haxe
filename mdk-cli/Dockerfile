# p0l0us/haxe:3.4-mdk-cli-yhaxen-0.0.50-ant-1.9.9-openjdk-12-node-carbon-alpine
#
# Project specific image adding required tools (some are private).
#
# Following environment vairables are required to enable Yhaxen GIT dependency loading:
#	SSH_KNOWN_HOSTS_GZIP_BASE64
#	SSH_PRIVATE_KEY_GZIP_BASE64
#
# Project specific deployment path:
#	AWS_MOUNT_PATH - aws-iss samba share path
#	AWS_MOUNT_USERNAME - aws-iss samba share username
#	AWS_MOUNT_PASSWORD - aws-iss samba share password
#
# AWS samba share will be mounted to `/mnt/aws-iis`
#
# Due mount.cifs command, docker container requires following arguments:
# `--cap-add SYS_ADMIN --cap-add DAC_READ_SEARCH`

FROM p0l0us/haxe:3.4-yhaxen-0.0.50-ant-1.9.9-openjdk-12-node-carbon-alpine
MAINTAINER polehla@gmail.com

# Container requires following environment vairables:
#	SSH_KNOWN_HOSTS_GZIP_BASE64
#	SSH_PRIVATE_KEY_GZIP_BASE64

RUN npm config set unsafe-perm true
	
RUN npm install -g node-sass@4.5.3

RUN mkdir /mnt/aws-iis && \
	apk update && \
	apk add cifs-utils
	
RUN mkdir -p /usr/local/share/ant

COPY jars/* /usr/share/java/apache-ant/lib/
	
COPY bin/* /usr/local/bin/

RUN chmod +rx /usr/local/bin/docker-entrypoint.sh &&\
	chmod +rx /usr/local/bin/set-haxe &&\
	chmod +rx /usr/local/bin/set-nodejs

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["haxelib", "run", "yhaxen"]
