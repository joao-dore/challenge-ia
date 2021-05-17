resource "aws_security_group" "challenge-sg" {
  name        = "challenge-sg"
  description = "challenge-sg"
  //vpc_id      = aws_vpc.challenge-vpc.id

  egress {
    cidr_blocks = [
      "0.0.0.0/0",
    ]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }

  ingress {
    cidr_blocks = [
      "177.206.166.171/32",
    ]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }

  tags = {
    Name = "challenge-sg"
  }
}


//resource "aws_vpc" "challenge-vpc" {
//  cidr_block = var.cidr_block
//  enable_dns_hostnames = true
//  tags = {
//    Name = "challenge-vpc"
//  }
//}

//resource "aws_subnet" "challenge-subnet" {
//  vpc_id     = aws_vpc.challenge-vpc.id
//  cidr_block = "172.31.48.0/20"
//  map_public_ip_on_launch = true
//  tags = {
//    Name = "challenge-subnet"
//  }
//}

//resource "aws_internet_gateway" "challenge-gw" {
//  vpc_id = aws_vpc.challenge-vpc.id
//
//  tags = {
//    Name = "main"
//  }
//}