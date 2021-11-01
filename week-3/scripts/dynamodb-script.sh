#!/bin/bash
export AWS_DEFAULT_REGION=us-west-2
aws dynamodb list-tables
aws dynamodb put-item --table-name aws_course_week3 --item "{\"ID\":{\"S\":\"$(uuidgen)\"},\"FIRST_NAME\":{\"S\":\"Elon\"},\"LAST_NAME\":{\"S\":\"Musk\"},\"COMPANY\":{\"S\":\"SpaceX\"}}"
aws dynamodb put-item --table-name aws_course_week3 --item "{\"ID\":{\"S\":\"$(uuidgen)\"},\"FIRST_NAME\":{\"S\":\"Bill\"},\"LAST_NAME\":{\"S\":\"Gates\"},\"COMPANY\":{\"S\":\"Microsoft\"}}"
aws dynamodb scan --table-name aws_course_week3
