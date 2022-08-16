terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.26.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_kms_key" "keyterraform" {
  description             = "key terraform"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket" "tfstates3" {
  bucket        = var.namebucket
  force_destroy = true
  lifecycle {
    ignore_changes = [server_side_encryption_configuration]
  }

}
resource "aws_s3_bucket_server_side_encryption_configuration" "bucketencrypt" {
  bucket = aws_s3_bucket.tfstates3.bucket
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.keyterraform.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_acl" "tfstates3_bucket_acl" {
  bucket = aws_s3_bucket.tfstates3.id
  acl    = var.acl
}

output "arn" {
  value = aws_kms_key.keyterraform.arn
}
