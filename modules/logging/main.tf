variable "region" { type = string }
variable "bucket_name" { type = string }

terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
}

provider "aws" { region = var.region }

resource "aws_s3_bucket" "logs" { bucket = var.bucket_name }

resource "aws_cloudtrail" "trail" {
  name           = "lz-trail"
  s3_bucket_name = aws_s3_bucket.logs.id
}
