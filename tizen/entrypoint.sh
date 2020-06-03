#!/bin/bash
set -ex

if [ "$TIZEN_RELEASE" = true ]; then
    aws s3 cp $BUCKET_PATH tizen --recursive
    tizen security-profiles add -n $PROFILE_NAME -a tizen/author.p12 -p ${SECURITY_PROFILES_PASSWD} -d tizen/distributor.p12 -dp ${SECURITY_PROFILES_PASSWD}
fi
