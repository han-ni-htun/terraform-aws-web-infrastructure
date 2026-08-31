resource "aws_vpc" "hellocloud" {
  region               = var.region
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name        = "${var.prefix}-vpc-${var.region}"
    Environment = var.environment
  }
}

resource "aws_subnet" "hellocloud" {
  vpc_id     = aws_vpc.hellocloud.id
  cidr_block = var.subnet_cidr_block

  tags = {
    Name = "${var.prefix}-subnet"
  }
}

resource "aws_security_group" "hellocloud" {
  name        = "${var.prefix}-security-group"
  description = "Security group for HelloCloud resources"
  vpc_id      = aws_vpc.hellocloud.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_allowed_cidr]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = []
  }

  tags = {
    Name = "${var.prefix}-security-group"
  }
}

resource "aws_internet_gateway" "hellocloud" {
  vpc_id = aws_vpc.hellocloud.id

  tags = {
    Name = "${var.prefix}-internet-gateway"
  }
}

resource "aws_route_table" "hellocloud" {
  vpc_id = aws_vpc.hellocloud.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.hellocloud.id
  }

  tags = {
    Name = "${var.prefix}-route-table"
  }
}

resource "aws_route_table_association" "hellocloud" {
  subnet_id      = aws_subnet.hellocloud.id
  route_table_id = aws_route_table.hellocloud.id
}

resource "aws_eip" "hellocloud" {
  domain = "vpc"

  tags = {
    Name = "${var.prefix}-eip"
  }
}

resource "aws_eip_association" "hellocloud" {
  instance_id   = aws_instance.hellocloud.id
  allocation_id = aws_eip.hellocloud.id
}