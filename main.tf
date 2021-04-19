provider "aws" {
  profile = "sgti-st-sb003"
  region  = "eu-west-1"
}

# create the VPC
resource "aws_vpc" "Alisa_VPC" {
    cidr_block           = "10.0.1.0/24"
    enable_dns_support   = true
    enable_dns_hostnames = true
    tags = {
        Name = "Alisa PROD VPC"
    }
    } 
    
# create the Subnet
resource "aws_subnet" "Alisa_Subnet" {
    vpc_id                  = aws_vpc.Alisa_VPC.id
    cidr_block              = "10.0.1.0/26"
    tags = {
    Name = "Alisa VPC Subnet"
    }
    }

#create ec2 instance
resource "aws_instance" "alisa_app_server" {
  ami           = "ami-08f3d1396f343504e"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}