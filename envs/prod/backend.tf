terraform {
  backend "s3" {
    bucket         = "CHANGE-ME-STATE-BUCKET"
    key            = "envs/prod/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "tf-lock"
    encrypt        = true
  }
}
