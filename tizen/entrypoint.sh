#!/bin/bash
set -ex

aws s3 cp s3://dazn-fe-build-data/tizen tizen --recursive

tizen security-profiles add -n DAZN -a tizen/author.p12 -p ${SECURITY_PROFILES_PASSWD} -d tizen/distributor.p12 -dp ${SECURITY_PROFILES_PASSWD}
