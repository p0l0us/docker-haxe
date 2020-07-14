#!/bin/sh
set -e

# Get Android Certificate file from S3
if [ -n "${BUCKET_PATH}" ]
then
	aws s3 cp ${BUCKET_PATH} /var/lib/android --recursive
fi

exec "$@"
