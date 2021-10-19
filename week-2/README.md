* Set variables in `terraform.tfvars` file 
```
access_key = "AWS access key"
secret_key = "AWS secret key"
key_name = "name of your ssh key"
bucket_name = "your bucket name" 
```
* Run the script
  * `export BUCKET_NAME=<YOUR_BUCKET_NAME>`
  * `./init-s3.sh`
* Deploy infrastructure
  * `terraform init`
  * `terraform apply`
* Check if file from the bucket exist in /home/ec2-user folder