## Creates a VPC resource with 2 Public and 2 Private Subnets
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "luke-tf-vpc"
  }
}

## Creates the first public subnet in AZ1
resource "aws_subnet" "my_public_subnet_az1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.16.0/20"
  availability_zone = "us-east-1a"

  tags = {
    Name = "luke-tf-public-subnet-az1"
  }
}

## Creates the first private subnet in AZ1
resource "aws_subnet" "my_private_subnet_az1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.128.0/20"
  availability_zone = "us-east-1a"

  tags = {
    Name = "luke-tf-private-subnet-az1"
  }
}

## Creates the second public subnet in AZ2
resource "aws_subnet" "my_public_subnet_az2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.144.0/20"
  availability_zone = "us-east-1b"

  tags = {
    Name = "luke-tf-public-subnet-az2"
  }
}

## Creates the second private subnet in AZ2
resource "aws_subnet" "my_private_subnet_az2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.240.0/20"
  availability_zone = "us-east-1b"

  tags = {
    Name = "luke-tf-private-subnet-az2"
  }
}

## Creates an IGW for your VPC
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "luke-tf-igw"
  }
}
