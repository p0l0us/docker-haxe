# p0l0us/haxe:3.4-yhaxen-0.0.50-ant-openjdk-12-node-carbon-alpine
#
# Yhaxen added to Ant + OpenJDK + Haxe + NodeJS docker image.
#  
# See Yhaxen here: 
#      https://github.com/jozefchutka/YHaxen/tree/master/src/main/haxe/yhaxen
#
# Following environment vairables are required to enable Yhaxen GIT dependency loading:
#     SSH_KNOWN_HOSTS_GZIP_BASE64
#     SSH_PRIVATE_KEY_GZIP_BASE64
# 
# Note: This image was created for bamboo automation build. Due limited 
#       bamboo variable lenght private key has to be compressed and 
#       base64 encoded. Can be done using following commands:
#
# cat ~/.ssh/known_hosts | gzip | base64 -w0 
# cat ~/.ssh/id_rsa | gzip | base64 -w0
#
# -w0 argument doesn't exists within alpine base64 encoder. Use Ubuntu or Debian linux to encode.

FROM p0l0us/haxe:3.4-ant-openjdk-12-node-carbon-alpine
MAINTAINER polehla@gmail.com

ENV YHAXEN_VERSION 0.0.50

RUN haxelib install yhaxen $YHAXEN_VERSION
	
RUN apk update && apk upgrade && \
	apk add --no-cache bash git openssh

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +rx /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["haxelib", "run", "yhaxen"]
