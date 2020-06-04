#!/bin/bash
set -ex

if [ "$TIZEN_RELEASE" = true ]; then
    aws s3 cp $BUCKET_PATH /tmp/tizen --recursive
    tizen security-profiles add -n $PROFILE_NAME -a /tmp/tizen/author.p12 -p $SECURITY_PROFILES_PASSWD -d /tmp/tizen/distributor.p12 -dp $SECURITY_PROFILES_PASSWD
fi
