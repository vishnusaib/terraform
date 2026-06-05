terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.45.0"
    }
  }
  backend "s3" {
    bucket = "vishnu-remote-state"
    key    = "vishnu-remote-provisioners"
    region = "us-east-1"
    #dynamodb_table = "vishnu-remote-state"
    encrypt = true
    use_lockfile = true
  }
}

provider "aws" {
  # Configuration options
}