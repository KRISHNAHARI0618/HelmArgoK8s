terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.97.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "name" {
  ami             = "amiid"
  security_groups = ["0.0.0.0/0"]
  tags = {
    "key" = "devops"
  }

}
