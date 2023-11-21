terraform {
  required_providers {
    aws = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  profile = "default"
  region = "us-west-2"
}

resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "test_docker_terraform"
  ami = "ami-830c94e3"
  instance_type = "t2.micro"


  ports {
    internal = 80
    external = 8000
  }

  tags = {
    name = "Instance use AWS"
  }
}

