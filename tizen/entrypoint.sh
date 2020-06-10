#!/bin/bash
set -e

// The entrypoint copies the tizen profile certificates from S3 bucket 
// and install to tizen profiles. It requires following environment
// variables:
//    AWS_ACCESS_KEY_ID - S3 key
//    AWS_SECRET_ACCESS_KEY - S3 secret key
//    BUCKET_PATH - path to folder where certs are stored (without "/" at the end)
//    TIZEN_PROFILE_NAME - Tizen profile name
//    TIZEN_AUTHOR_FILE - Tizen author certificate file path relative to BUCKET_PATH (without starting "/")
//    TIZEN_AUTHOR_PASSWORD - Password for tizen author certificate
//    TIZEN_DISTRIBUTOR_FILE - Tizen distributor certificate file path relative to BUCKET_PATH (without starting "/")
//    TIZEN_DISTRIBUTOR_PASSWORD - Tizen distributor certificate password


TIZEN_PROFILE_FILE="/home/massive/tizen-studio-data/profile/profiles.xml"
CERT_PATH="/home/massive/tizen-studio-data/certificates"

if [ -n "${TIZEN_AUTHOR_PASSWORD}" ] && [ -n "${TIZEN_DISTRIBUTOR_PASSWORD}" ]
then
    aws s3 cp $BUCKET_PATH ${CERT_PATH} --recursive
    tizen security-profiles add -n "${TIZEN_PROFILE_NAME}" -a "${CERT_PATH}/${TIZEN_AUTHOR_FILE}" -p "${TIZEN_AUTHOR_PASSWORD}" -d "${CERT_PATH}/${TIZEN_DISTRIBUTOR_FILE}" -dp "${TIZEN_DISTRIBUTOR_PASSWORD}"
    // following lines are fixing known Tizen CLI bug causing incorrect password stored in tizen profiles.xml.
    sed -i -e "/author/ s/\(password=\"\).*pwd\(\".*\)/\1${TIZEN_AUTHOR_PASSWORD}\2/g" ${TIZEN_PROFILE_FILE}
    sed -i -e "/distributor/ s/\(password=\"\).*pwd\(\".*\)/\1${TIZEN_DISTRIBUTOR_PASSWORD}\2/g" ${TIZEN_PROFILE_FILE}
fi

exec "$@"
