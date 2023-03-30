# Configure the AWS Provider
provider "aws" {
  region  = "us-east-1"
  profile = "Terraform"
}

resource "aws_s3_bucket" "S3-basico" {
  bucket = "s3-basico"

  tags = {
    Name        = "s3-basico"
    Environment = "qa"
  }
}

resource "aws_instance" "servidor-ec2-web" {
  ami           = "ami-00c39f71452c08778"
  instance_type = "t2.micro"

  tags = {
    Name = "servidor-ec2-web"
  }
}

resource "aws_instance" "servidor-ec2-bd" {
  ami           = "ami-00c39f71452c08778"
  instance_type = "t2.micro"

  tags = {
    Name = "servidor-ec2-bd"
  }
}

resource "aws_instance" "servidor-ec2-backend" {
  ami           = "ami-00c39f71452c08778"
  instance_type = "t2.micro"

  tags = {
    Name = "servidor-ec2-backend"
  }
}

resource "aws_sqs_queue" "sqs-basica" {
  name                      = "sqs-basica"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10

  tags = {
    Environment = "lab"
  }
}
