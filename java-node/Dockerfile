# p0l0us/haxe:3.4-openjdk-12-node-carbon-alpine
#
# Openjdk 12 added to Haxe + NodeJS docker image.
#

FROM p0l0us/haxe:3.4-node-carbon-alpine
MAINTAINER polehla@gmail.com

ENV JAVA_PKG=openjdk8

RUN apk --no-cache update &&\
	apk --no-cache upgrade &&\
	apk --no-cache add ${JAVA_PKG}  &&\
	rm -rf /tmp/*

# Start container
CMD ["java","-version"] 
