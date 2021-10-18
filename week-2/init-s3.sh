#!/bin/bash
aws s3api create-bucket --bucket rlutstestbucket --region us-east-1
aws s3api put-bucket-versioning --bucket rlutstestbucket --versioning-configuration "Status=Enabled"
touch terraform.txt
echo "Downloaded from S3" > terraform.txt
aws s3 cp terraform.txt s3://rlutstestbucket/