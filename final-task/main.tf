provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./vpc"

  availability_zones = var.availability_zones
  nat_server_id      = module.ec2.nat_server_id
}

module "ec2" {
  source = "./ec2"

  public_subnet_1_id    = module.vpc.public_subnet_1_id
  public_subnet_2_id    = module.vpc.public_subnet_2_id
  private_subnet_1_id   = module.vpc.private_subnet_1_id
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  bucket_name           = var.bucket_name
  calc_app_file_name    = var.calc_app_file_name
  persist_app_file_name = var.persist_app_file_name
  vpc                   = module.vpc.vpc
  key_name              = var.key_name
  rds_host              = module.rds.rds_host
  nat_ami_id            = var.nat_ami_id
}

module "rds" {
  source = "./rds"

  vpc             = module.vpc.vpc
  rds_credentials = var.rds_credentials
  subnets_ids     = [module.vpc.private_subnet_1_id, module.vpc.private_subnet_2_id]
  rds_name        = var.rds_name
}

module "messaging" {
  source = "./messaging"

  sns_topic_name = var.sns_topic_name
  sqs_queue_name = var.sqs_queue_name
}

module "dynamodb" {
  source = "./dynamodb"

  dynamodb_table_name = var.dynamodb_table_name
}