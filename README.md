# docker-haxe

## p0l0us/haxe:3.4-node-carbon-alpine
https://github.com/p0l0us/docker-haxe/tree/3.4-node-carbon-alpine

Haxe + NodeJS docker image.

Based on official node image:
    https://hub.docker.com/_/node
    https://github.com/nodejs/docker-node/blob/7e47b378c42b03ae6afae704c5bf5b724aae2b92/8/alpine/Dockerfile

Haxe instalation copied from:
    https://github.com/HaxeFoundation/docker-library-haxe/blob/d94c754a343676aede20497b5d28e8264e446ca6/3.4/alpine3.9/Dockerfile

## p0l0us/haxe:3.4-openjdk-12-node-carbon-alpine
https://github.com/p0l0us/docker-haxe/tree/3.4-openjdk-12-node-carbon-alpine

Openjdk 12 added to Haxe + NodeJS docker image.

OpenJDK installation copied from:
    https://github.com/AdoptOpenJDK/openjdk-docker/tree/master/12/jdk/alpine


## p0l0us/haxe:3.4-ant-1.9.9-openjdk-12-node-carbon-alpine
https://github.com/p0l0us/docker-haxe/tree/3.4-ant-1.9.9-openjdk-12-node-carbon-alpine

Ant added to OpenJDK 12 + Haxe + NodeJS docker image.

Ant installation taken from:
    https://github.com/inikolaev/docker-images


## p0l0us/haxe:3.4-yhaxen-0.0.50-ant-1.9.9-openjdk-12-node-carbon-alpine
https://github.com/p0l0us/docker-haxe/tree/3.4-yhaxen-0.0.50-ant-1.9.9-openjdk-12-node-carbon-alpine

Yhaxen added to Ant + OpenJDK + Haxe + NodeJS docker image.
 
See Yhaxen here: 
    https://github.com/jozefchutka/YHaxen/tree/master/src/main/haxe/yhaxen

Following environment vairables are required to enable Yhaxen GIT dependency loading:
    SSH_KNOWN_HOSTS_GZIP_BASE64
    SSH_PRIVATE_KEY_GZIP_BASE64
 
Note: This image was created for bamboo automation build. Due limited 
      bamboo variable lenght private key has to be compressed and 
      base64 encoded. Can be done using following commands:

`cat ~/.ssh/known_hosts | gzip | base64 -w0`
`cat ~/.ssh/id_rsa | gzip | base64 -w0`

`-w0` argument doesn't exists within alpine base64 encoder. Use Ubuntu or Debian linux to encode.