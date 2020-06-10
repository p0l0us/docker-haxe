#!/bin/bash
set -e

TIZEN_PROFILE_FILE="/home/massive/tizen-studio-data/profile/profiles.xml"
CERT_PATH="/home/massive/tizen-studio-data/certificates"

if [ -n "${TIZEN_AUTHOR_PASSWORD}" ] && [ -n "${TIZEN_DISTRIBUTOR_PASSWORD}" ]
then
    aws s3 cp $BUCKET_PATH ${CERT_PATH} --recursive
    tizen security-profiles add -n "${TIZEN_PROFILE_NAME}" -a "${CERT_PATH}/${TIZEN_AUTHOR_FILE}" -p "${TIZEN_AUTHOR_PASSWORD}" -d "${CERT_PATH}/${TIZEN_DISTRIBUTOR_FILE}" -dp "${TIZEN_DISTRIBUTOR_PASSWORD}"
    sed -i -e "/author/ s/\(password=\"\).*pwd\(\".*\)/\1${TIZEN_AUTHOR_PASSWORD}\2/g" ${TIZEN_PROFILE_FILE}
    sed -i -e "/distributor/ s/\(password=\"\).*pwd\(\".*\)/\1${TIZEN_DISTRIBUTOR_PASSWORD}\2/g" ${TIZEN_PROFILE_FILE}
fi

exec "$@"
