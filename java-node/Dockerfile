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

COPY java-env.sh /etc/profile.d/java-env.sh

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH "$JAVA_HOME/bin:${PATH}"

RUN java -version
RUN javac -version

# Start container
CMD ["java","-version"] 
