resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc-main"
  }

resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/24" // Diferente em cada subnet para n causar problemas

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public-subnet"
  }
}

 resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igw-demo"
  }
}

resource "aws_route_table" "route-table-public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.igw.id
  }

  tags = {
    Name = "example"
  }
}

resource "aws_route_table_association" "public_subnet" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.route-table-public.id
}