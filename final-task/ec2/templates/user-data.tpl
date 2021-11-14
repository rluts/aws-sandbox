#!/bin/bash

yum update -y
yum install -y java-1.8.0-openjdk

aws s3 cp s3://${bucket_name}/${file_name} /root/${file_name}

%{ for name, value in jsondecode(environments) ~}
export ${name}=${value}
echo "${name}=${value}" >> /etc/environment
%{ endfor ~}

%{ for app in jsondecode(installations) ~}
amazon-linux-extras install ${app}
%{ endfor ~}

java -jar /root/${file_name}
