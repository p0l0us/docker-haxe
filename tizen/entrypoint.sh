#!/bin/bash
set -e

if [ -n "${TIZEN_AUTHOR_PASSWORD}" ] && [ -n "${TIZEN_DISTRIBUTOR_PASSWORD}" ]
then
    aws s3 cp $BUCKET_PATH /tmp/tizen_profile --recursive
    tizen security-profiles add -n ${TIZEN_PROFILE_NAME} -a /tmp/tizen_profile/author.p12 -p "${TIZEN_AUTHOR_PASSWORD}" -d /tmp/tizen_profile/distributor.p12 -dp "${TIZEN_DISTRIBUTOR_PASSWORD}"
    rm -fr /tmp/tizen_profile
fi

exec "$@"
