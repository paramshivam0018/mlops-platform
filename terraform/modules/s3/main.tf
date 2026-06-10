# S3 bucket to store ML models
resource "aws_s3_bucket" "mlops" {
  bucket = "mlops-iris-models-${var.environment}-${random_id.suffix.hex}"

  tags = {
    Name        = "mlops-models"
    Environment = var.environment
  }
}

# Random suffix to ensure bucket name is unique globally
resource "random_id" "suffix" {
  byte_length = 4
}

# Block all public access to the bucket
resource "aws_s3_bucket_public_access_block" "mlops" {
  bucket = aws_s3_bucket.mlops.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Enable versioning so we can track model versions
resource "aws_s3_bucket_versioning" "mlops" {
  bucket = aws_s3_bucket.mlops.id
  versioning_configuration {
    status = "Enabled"
  }
}
