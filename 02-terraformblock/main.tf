terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 6.31.0"
    }
    random = {
        source = "hashicorp/random"
        version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "tfgugu"
}

resource "random_id"  "bucket_sufix" {
    byte_lenght = 6
}

