terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source       = "./modules/vpc"
  cluster_name = var.cluster_name
  vpc_cidr     = var.vpc_cidr
  environment  = var.environment
}

module "iam" {
  source = "./modules/iam"
}

module "eks" {
  source          = "./modules/eks"
  cluster_name    = var.cluster_name
  subnet_ids      = module.vpc.subnet_ids
  node_role_arn   = module.iam.node_role_arn
  cluster_role_arn = module.iam.cluster_role_arn
  environment     = var.environment
}

module "s3" {
  source       = "./modules/s3"
  environment  = var.environment
}
