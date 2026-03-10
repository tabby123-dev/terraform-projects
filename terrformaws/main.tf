locals {
  # normalized workspace name
  environment = terraform.workspace == "default" ? "dev" : terraform.workspace

  # base app/project name
  project = "wtf"

  # standard prefix pattern for all resources
  prefix = "${local.project}-${local.environment}"
}



terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  # backend "s3" {
  #   bucket = "wtf_bucket"
  #   key = "wtf-app/terraform.tfstate"
  # }
}


resource "aws_s3_bucket" "wtf_bucket" {
  bucket = "dev-wtfbucket2025"
  tags = {
    name = "${local.prefix}-bucket"
  }
}


module "vpc-modules" {

  source            = "./modules/vpc-modules"
  region            = var.region
  vpc_cidr_block    = var.vpc_cidr_block
  az                = var.az
  subnet_cidr_block = var.subnet_cidr_block

}


module "ec2-modules" {
  source        = "./modules/ec2-modules"
  instance_type = var.instance_type
  region        = var.region
  az            = var.az
  vpc_id        = module.vpc-modules.vpc_id
  subnet_id = module.vpc-modules.subnet_id
}