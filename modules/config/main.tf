variable "region" { type = string }
variable "delivery_bucket" { type = string }

terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
}

provider "aws" { region = var.region }

resource "aws_config_configuration_recorder" "rec" {
  name     = "default"
  role_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
  recording_group { all_supported = true }
}

resource "aws_config_delivery_channel" "chan" {
  name           = "default"
  s3_bucket_name = var.delivery_bucket
}
