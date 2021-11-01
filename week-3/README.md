* Set variables in `terraform.tfvars` file 
```
key_name = "name of your ssh key"
bucket_name = "your bucket name" 
rds_credentials = { username = "<DB_USER>", password = "DB_PASSWORD" }
```
* Run the script
  * `export BUCKET_NAME=<YOUR_BUCKET_NAME>`
  * `cd scripts && ./init.sh && cd ..`
* Deploy infrastructure
  * `terraform init`
  * `terraform apply`
* Run SQL script
  * `psql -h <ENDPOINT_URL_FROM_OUTPUT> -U <DB_USER_FROM_VARIABLES> -a -f rds-script.sql`
  * enter postgresql password (from terraform rds_credentials variable)
* Run DynamoDb bash-script
  * ./dynamodb-script.sh