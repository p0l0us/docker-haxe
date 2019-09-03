# p0l0us/haxe:3.4-ant-1.9.9-openjdk-12-node-carbon-alpine
#
# Ant added to OpenJDK 12 + Haxe + NodeJS docker image.
#
# Ant installation taken from:
# https://github.com/inikolaev/docker-images

FROM p0l0us/haxe:3.4-openjdk-12-node-carbon-alpine
MAINTAINER polehla@gmail.com

USER root

RUN apk update && apk add apache-ant
	
CMD ["ant"]