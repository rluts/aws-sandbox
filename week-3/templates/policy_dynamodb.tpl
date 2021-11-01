{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AccessTableAllIndexesOnBooks1",
            "Effect": "Allow",
            "Action": [
              "dynamodb:PutItem",
              "dynamodb:UpdateItem",
              "dynamodb:DeleteItem",
              "dynamodb:BatchWriteItem",
              "dynamodb:GetItem",
              "dynamodb:BatchGetItem",
              "dynamodb:Scan",
              "dynamodb:Query",
              "dynamodb:ConditionCheckItem"
            ],
            "Resource": [
                "${dynamodb_arn}",
                "${dynamodb_arn}/index/*"
            ]
        },
        {
            "Sid": "AccessTableAllIndexesOnBooks2",
            "Effect": "Allow",
            "Action": [
              "dynamodb:DescribeTable",
              "dynamodb:ListTables"
            ],
            "Resource": [
                "arn:aws:dynamodb:us-west-2:${account_number}:table/*"
            ]
        }
    ]
}