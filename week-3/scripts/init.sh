#!/bin/bash


[[ -z "$BUCKET_NAME" ]] && echo "Set bucket name 'export BUCKET_NAME=<YOUR_BUCKET_NAME>'" && exit 1

aws s3api create-bucket --bucket "${BUCKET_NAME}" --region us-east-1
aws s3api put-bucket-versioning --bucket "${BUCKET_NAME}" --versioning-configuration "Status=Enabled"

aws s3 cp dynamodb-script.sh "s3://${BUCKET_NAME}/"
aws s3 cp rds-script.sql "s3://${BUCKET_NAME}/"
