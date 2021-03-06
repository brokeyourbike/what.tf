terraform {
  backend "remote" {
    organization = "BrokeYourBike"
    workspaces {
      name = "Learn-Workspace"
    }
  }

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
  ami           = "ami-001c5f3c0a8b3f245"
  instance_type = "t3.nano"

  tags = {
    Name = var.instance_name
  }
}
