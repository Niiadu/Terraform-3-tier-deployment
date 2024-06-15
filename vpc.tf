resource "aws_vpc" "vpc-01" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "Nii-VPC"
  }
}

resource "aws_subnet" "pub-sn-1" {
  vpc_id                  = aws_vpc.vpc-01.id
  cidr_block              = var.public-subnet-01-cidr
  availability_zone       = "eu-north-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-subnet-1"
  }
}

resource "aws_subnet" "pub-sn-2" {
  vpc_id                  = aws_vpc.vpc-01.id
  cidr_block              = var.public-subent-02-cidr
  availability_zone       = "eu-north-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-subnet-2"
  }
}

resource "aws_subnet" "pri-sn-1" {
  vpc_id                  = aws_vpc.vpc-01.id
  cidr_block              = var.private-subent-01-cidr
  availability_zone       = "eu-north-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private-subnet-1 | App Tier"
  }
}

resource "aws_subnet" "pri-sn-2" {
  vpc_id                  = aws_vpc.vpc-01.id
  cidr_block              = var.private-subent-02-cidr
  availability_zone       = "eu-north-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private-subnet-2 | App tier"
  }
}


resource "aws_subnet" "private-db-subnet-1" {
  vpc_id                  = aws_vpc.vpc-01.id
  cidr_block              = var.private-db-subnet-1-cidr
  availability_zone       = "eu-north-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private-DB-subnet-1 | DB Tier"
  }
}

resource "aws_subnet" "private-db-subnet-2" {
  vpc_id                  = aws_vpc.vpc-01.id
  cidr_block              = var.private-db-subnet-2-cidr
  availability_zone       = "eu-north-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private-DB-subnet-2 | DB tier"
  }
}
