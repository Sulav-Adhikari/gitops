provider "aws" {
  region = "us-east-1"
}



resource "aws_s3_bucket" "sulav-terraform-state" {
  bucket = "sulav-terraform-state"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  object_lock_configuration {
    object_lock_enabled = "Enabled"
  }
  # Tags
  tags = merge(
    var.additional_tags,
    {
      Name      = "sulav-S3-terraform-state"
      Deletable = "Yes",
      Project   = "Intern",
      Creator   = "sulav.adk.7@gmail.com",
    }
  )
}