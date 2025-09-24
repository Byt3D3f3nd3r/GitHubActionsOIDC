variable "region"       { default = "eu-west-1" }
variable "environment"  { default = "dev" }
variable "logs_bucket"  { default = "lz-dev-logs-CHANGE-ME" }
variable "vpc_cidr"     { default = "10.0.0.0/16" }

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      environment = var.environment
      project     = "landing-zone"
    }
  }
}

module "logging" {
  source      = "../../modules/logging"
  region      = var.region
  bucket_name = var.logs_bucket
}

module "network" {
  source   = "../../modules/network"
  region   = var.region
  vpc_cidr = var.vpc_cidr
}
