variable "region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "cluster_name" {
  description = "EKS cluster name"
  default     = "mlops-cluster"
}

variable "environment" {
  description = "Environment name"
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}
