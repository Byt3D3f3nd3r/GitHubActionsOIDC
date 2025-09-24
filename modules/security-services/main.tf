variable "region" { type = string }

terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
}

provider "aws" { region = var.region }

resource "aws_guardduty_detector" "gd" { enable = true }

resource "aws_securityhub_account" "hub" { auto_enable_controls = true }
