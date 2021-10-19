#!/bin/bash


[[ -z "$BUCKET_NAME" ]] && echo "Set bucket name 'export BUCKET_NAME=<YOUR_BUCKET_NAME>'" && exit 1

aws s3api create-bucket --bucket "${BUCKET_NAME}" --region us-east-1
aws s3api put-bucket-versioning --bucket "${BUCKET_NAME}" --versioning-configuration "Status=Enabled"
touch terraform.txt
echo "Downloaded from S3" > terraform.txt
aws s3 cp terraform.txt "s3://${BUCKET_NAME}/"
