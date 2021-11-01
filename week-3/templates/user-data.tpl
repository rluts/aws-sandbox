#!/bin/bash
amazon-linux-extras install -y postgresql12


aws s3 cp s3://${bucket_name}/dynamodb-script.sh /home/ec2-user/
aws s3 cp s3://${bucket_name}/rds-script.sql /home/ec2-user/