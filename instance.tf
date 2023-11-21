terraform{
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.27"
        }
    }

    required_version = ">= 0.14.9"
}

provider "aws" {
    profile = "default"
    region = "us-west-2"
}

resource "aws_instance" "app-server" {
    ami = "ami-0fc5d935ebf8bc3bc"
    instance_type = "t2.micro"

    tags =  {
        name = "Primary Instance in AWS"
    }
}