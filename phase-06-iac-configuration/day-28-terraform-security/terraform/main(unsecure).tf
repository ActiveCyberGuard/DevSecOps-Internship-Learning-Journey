# Configured by: MD.AL-AMIN

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Weak S3 Bucket (Publicly Accessible & Unencrypted)
resource "aws_s3_bucket" "weak_bucket" {
  bucket = "my-devsecops-lab-bucket-alamin"
}

resource "aws_s3_bucket_acl" "weak_bucket_acl" {
  bucket = aws_s3_bucket.weak_bucket.id
  acl    = "public-read"
}

# Weak Security Group (Open SSH 0.0.0.0/0)
resource "aws_security_group" "weak_sg" {
  name        = "weak-sec-group"
  description = "Intentionally insecure security group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}