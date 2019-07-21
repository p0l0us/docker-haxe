FROM p0l0us/haxe:3.4-node-carbon-alpine

MAINTAINER polehla@gmail.com

# Container requires SSH_PRIVATE_KEY env variable
# in order to enable git dependencies.

ENV YHAXEN_VERSION 0.0.50
	
RUN apk update && apk upgrade && \
	haxelib install yhaxen $YHAXEN_VERSION

RUN apk add --no-cache bash git openssh && \
    mkdir ~/.ssh/ && \
    echo -e "Host * \
    \n   StrictHostKeyChecking no \
    \n   UserKnownHostsFile=/dev/null" >> ~/.ssh/config && \
	touch ~/.ssh/id_rsa && \
	chmod 600 ~/.ssh/id_rsa
	
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +rx /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["haxelib", "run", "yhaxen"]
