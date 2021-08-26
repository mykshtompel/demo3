#S3 bucket for terraform state
resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket_name
  #force_destroy = true

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [tags, tags_all]
  }

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

  tags = {
    Name = var.bucket_name
  }
}
