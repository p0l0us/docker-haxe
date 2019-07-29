# p0l0us/haxe:3.4-yhaxen-0.0.50-ant-node-carbon-jessie
#
# Container requires following environment vairables:
#     SSH_KNOWN_HOSTS_GZIP_BASE64
#     SSH_PRIVATE_KEY_GZIP_BASE64


FROM p0l0us/haxe:3.4-ant-node-carbon-jessie

MAINTAINER polehla@gmail.com

ENV YHAXEN_VERSION 0.0.50
	
RUN apt-get update && apt-get upgrade -y --no-install-recommends && \
	haxelib install yhaxen $YHAXEN_VERSION

RUN apt-get install bash git ssh -y --no-install-recommends

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +rx /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["haxelib", "run", "yhaxen"]
