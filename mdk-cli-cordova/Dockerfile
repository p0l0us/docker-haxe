# p0l0us/haxe:3.4-cordova-mdk-cli-yhaxen-0.0.50-ant-1.9.9-openjdk-12-node-carbon-alpine
#
# Project specific image adding required tools and mounts AWS folder.
# 
# The image allows us to run cordova, mdk-cli, yhaxen dependencies based on node & haxe base image.
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

FROM p0l0us/haxe:3.4-mdk-cli-yhaxen-0.0.50-ant-1.9.9-openjdk-12-node-carbon-alpine
MAINTAINER polehla@gmail.com

RUN apk update 

RUN apk add --no-cache bash unzip libstdc++

RUN apk add gradle

RUN mkdir -p /usr/local/android-sdk-linux && \
    wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip -O tools.zip && \
    unzip tools.zip -d /usr/local/android-sdk-linux && \
    rm tools.zip

# Set environment variable
ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV PATH ${ANDROID_HOME}/tools:$ANDROID_HOME/platform-tools:$PATH

# Make license agreement
RUN mkdir $ANDROID_HOME/licenses && \
    echo 8933bad161af4178b1185d1a37fbf41ea5269c55 > $ANDROID_HOME/licenses/android-sdk-license && \
    echo d56f5187479451eabf01fb78af6dfcb131a6481e >> $ANDROID_HOME/licenses/android-sdk-license && \
    echo 24333f8a63b6825ea9c5514f83c2829b004d1fee >> $ANDROID_HOME/licenses/android-sdk-license && \
    echo 84831b9409646a918e30573bab4c9c91346d8abd > $ANDROID_HOME/licenses/android-sdk-preview-license

# Update and install using sdkmanager
RUN $ANDROID_HOME/tools/bin/sdkmanager "tools" "platform-tools" && \
    $ANDROID_HOME/tools/bin/sdkmanager "build-tools;28.0.3" "build-tools;27.0.3" && \
    $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-28" "platforms;android-27" && \
    $ANDROID_HOME/tools/bin/sdkmanager "extras;android;m2repository" "extras;google;m2repository"

RUN npm install -g cordova@7.1.0

RUN chmod +rx /usr/local/bin/docker-entrypoint.sh &&\
	chmod +rx /usr/local/bin/set-haxe &&\
	chmod +rx /usr/local/bin/set-nodejs
	
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["haxelib", "run", "yhaxen"]
