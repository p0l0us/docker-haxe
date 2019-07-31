# p0l0us/haxe:3.4-ant-1.9.9-openjdk-12-node-carbon-alpine
#
# Ant added to OpenJDK 12 + Haxe + NodeJS docker image.
#
# Ant installation taken from:
# https://github.com/inikolaev/docker-images

FROM p0l0us/haxe:3.4-openjdk-12-node-carbon-alpine
MAINTAINER polehla@gmail.com

USER root

ENV ANT_VERSION 1.9.9
ENV ANT_HOME /etc/ant-${ANT_VERSION}

RUN cd /tmp \
    && wget http://archive.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz \
    && mkdir ant-${ANT_VERSION} \
    && tar -zxvf apache-ant-${ANT_VERSION}-bin.tar.gz \
    && mv apache-ant-${ANT_VERSION} ${ANT_HOME} \
    && rm apache-ant-${ANT_VERSION}-bin.tar.gz \
    && rm -rf ant-${ANT_VERSION} \
    && rm -rf ${ANT_HOME}/manual \
    && unset ANT_VERSION
ENV PATH ${PATH}:${ANT_HOME}/bin
	
CMD ["ant"]