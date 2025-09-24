variable "region" { type = string }

terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
}

provider "aws" { region = var.region }

resource "aws_iam_policy" "readonly_plus_sts" {
  name        = "LZReadOnlyPlusSTS"
  description = "ReadOnlyAccess plus sts:GetCallerIdentity"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      { Effect = "Allow", Action = ["sts:GetCallerIdentity"], Resource = "*" },
      { Effect = "Allow", Action = ["ec2:Describe*","s3:Get*","s3:List*"], Resource = "*" }
    ]
  })
}
