Checking SNS
```shell
aws sns publish --topic <topic ARN> --message 'hello world' --region us-west-2
```
Checking SQS
```shell
aws sqs send-message --queue-url <SQS URL> --message-body 'hello world!!!' --region us-west-2
aws sqs receive-message --queue-url <SQS URL> --region us-west-2
```