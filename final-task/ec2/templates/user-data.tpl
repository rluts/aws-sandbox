#!/bin/bash

yum update -y
yum install -y java-1.8.0-openjdk

aws s3 cp s3://${bucket_name}/${file_name} /root/${file_name}

%{ for name, value in jsondecode(environments) ~}
export ${name}=${value}
echo "${name}=${value}" >> /etc/environment
%{ endfor ~}

%{ for command in jsondecode(extra_commands) ~}
${command}
%{ endfor ~}

java -jar /root/${file_name}
