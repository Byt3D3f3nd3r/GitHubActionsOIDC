variable "bucket_name" { type = string }
variable "dynamodb_table" { type = string }
variable "region" { type = string }

terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
}

provider "aws" { region = var.region }

resource "aws_s3_bucket" "tfstate" { bucket = var.bucket_name }

resource "aws_dynamodb_table" "lock" {
  name         = var.dynamodb_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute { name = "LockID"; type = "S" }
}
