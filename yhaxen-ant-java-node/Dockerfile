# p0l0us/haxe:3.4-yhaxen-0.0.50-ant-1.9.9-openjdk-12-node-carbon-alpine
#
# Yhaxen added to Ant + OpenJDK + Haxe + NodeJS docker image.
#  
# See Yhaxen here: 
#      https://github.com/jozefchutka/YHaxen/tree/master/src/main/haxe/yhaxen
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

FROM p0l0us/haxe:3.4-ant-1.9.9-openjdk-12-node-carbon-alpine
MAINTAINER polehla@gmail.com

ENV YHAXEN_VERSION 0.0.50

RUN haxelib install yhaxen $YHAXEN_VERSION
	
RUN apk update && apk upgrade && \
	apk add --no-cache bash git openssh

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +rx /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["haxelib", "run", "yhaxen"]
