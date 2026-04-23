terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "helm_release" "app" {
  name  = "my-app"
  chart = "./chart"

  set = {
    name  = "db.endpoint"
    value = aws_db_instance.education.endpoint
  }
}