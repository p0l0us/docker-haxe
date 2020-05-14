#/bin/bash

docker build tizen -t p0l0us/haxe:tizen-cli-stretch
docker push p0l0us/haxe:tizen-cli-buster

docker build webos -t p0l0us/haxe:webos-cli-buster-slim
docker push p0l0us/haxe:webos-cli-buster-slim

docker build node -t p0l0us/haxe:3.4-node-carbon-alpine
docker push p0l0us/haxe:3.4-node-carbon-alpine

docker build java-node -t p0l0us/haxe:3.4-openjdk-12-node-carbon-alpine
docker push p0l0us/haxe:3.4-openjdk-12-node-carbon-alpine

docker build ant-java-node -t p0l0us/haxe:3.4-ant-1.9.9-openjdk-12-node-carbon-alpine
docker push p0l0us/haxe:3.4-ant-1.9.9-openjdk-12-node-carbon-alpine

docker build yhaxen-ant-java-node -t p0l0us/haxe:3.4-yhaxen-0.0.50-ant-1.9.9-openjdk-12-node-carbon-alpine
docker push p0l0us/haxe:3.4-yhaxen-0.0.50-ant-1.9.9-openjdk-12-node-carbon-alpine

docker build mdk-cli -t p0l0us/haxe:3.4-mdk-cli-yhaxen-0.0.50-ant-1.9.9-openjdk-12-node-carbon-alpine
docker push p0l0us/haxe:3.4-mdk-cli-yhaxen-0.0.50-ant-1.9.9-openjdk-12-node-carbon-alpine

docker build cordova -t p0l0us/haxe:3.4-cordova-mdk-cli-yhaxen-0.0.50-ant-1.9.9-openjdk-12-node-carbon-alpine
docker push p0l0us/haxe:3.4-cordova-mdk-cli-yhaxen-0.0.50-ant-1.9.9-openjdk-12-node-carbon-alpine






