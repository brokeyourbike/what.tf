terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-north-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0bd9c26722573e69b"
  instance_type = "t3.nano"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
