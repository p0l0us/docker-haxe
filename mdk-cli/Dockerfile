# p0l0us/haxe:3.4-mdk-cli-yhaxen-0.0.50-ant-1.9.9-openjdk-12-node-carbon-alpine
#
# Project specific image adding required tools (some are private).
#
# The image allows us to run mdk-cli, yhaxen dependency management based on node & haxe base image.
#
# Following optional environment vairables are accepted by the image entrypoint script:
#
# SSH setup:
#
#	SSH_KNOWN_HOSTS_GZIP_BASE64
#	SSH_PRIVATE_KEY_GZIP_BASE64
#
# Variables will be decoded and extracted to ~/.ssh/private.key and ~/.ssh/known_hosts files.
# You can achieve same efect by setting your private key and knownw hosts using sets of bash commands.
#
# This image was created for bamboo automation build. Due limited bamboo variable lenght private key
# has to be compressed (gzip) and base64 encoded. You can encode values by following commands:
# 
# cat ~/.ssh/known_hosts | gzip | base64 -w0 
# cat ~/.ssh/id_rsa | gzip | base64 -w0
#
# Note: -w0 argument doesn't exists within alpine base64 encoder. Use Ubuntu or Debian linux.
#
# Samba folder mount:
#
#	AWS_MOUNT_PATH - aws-iss samba share path
#	AWS_MOUNT_USERNAME - aws-iss samba share username
#	AWS_MOUNT_PASSWORD - aws-iss samba share password
#
# AWS samba shares will be mounted to `/mnt/aws-iis`
#
# Due mount.cifs command, docker container requires following arguments:
# `--cap-add SYS_ADMIN --cap-add DAC_READ_SEARCH`

FROM p0l0us/haxe:3.4-yhaxen-0.0.50-ant-1.9.9-openjdk-12-node-carbon-alpine
MAINTAINER polehla@gmail.com

ENV ANDROID_HOME /opt/android-sdk-linux
ENV SDK_TOOLS_VERSION 26.1.1
ENV API_LEVELS android-21,android-28
ENV BUILD_TOOLS_VERSIONS build-tools-28.0.3
ENV ANDROID_EXTRAS extra-android-m2repository,extra-android-support,extra-google-google_play_services,extra-google-m2repository
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools

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
	chmod +rx /usr/local/bin/set-nodejs &&\
	chmod +rx /usr/local/bin/set-webos

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["haxelib", "run", "yhaxen"]
