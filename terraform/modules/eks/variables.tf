variable "cluster_name" {
  description = "EKS cluster name"
}

variable "subnet_ids" {
  description = "List of subnet IDs for EKS"
}

variable "node_role_arn" {
  description = "IAM role ARN for worker nodes"
}

variable "cluster_role_arn" {
  description = "IAM role ARN for EKS cluster"
}

variable "environment" {
  description = "Environment name"
}
