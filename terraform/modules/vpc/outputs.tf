output "subnet_ids" {
  description = "List of subnet IDs"
  value       = aws_subnet.public[*].id
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}
