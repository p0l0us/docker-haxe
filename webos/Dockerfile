FROM debian:buster

RUN apt-get update 

RUN apt-get install wget ant -y

RUN wget https://webosose.s3.ap-northeast-2.amazonaws.com/tools/cli/v1.11.0/ares-webos-cli-linux-1.11.0.tgz

RUN gunzip -c ares-webos-cli-linux-1.11.0.tgz | tar xvf - && rm -rf ares-webos-cli-linux-1.11.0.tgz

RUN cp -r ares-cli /root/ares-cli

ENV PATH $PATH:/root/ares-cli/bin
