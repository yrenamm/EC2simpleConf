# AWS VPC resources creation

resource "aws_vpc" "vpc-httpd" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "vpc-for-httpd"
  }
}

# Subnets Creation
resource "aws_subnet" "vpc-httpd-public-subnet" {
  vpc_id                  = aws_vpc.vpc-httpd.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

# Internet Gateway Creation
resource "aws_internet_gateway" "vpc-httpd-igw" {
  vpc_id = aws_vpc.vpc-httpd.id
}

# Route Tables Creation
resource "aws_route_table" "vpc-httpd-public-route-table" {
  vpc_id = aws_vpc.vpc-httpd.id
}

# Route in Route Table for Internet Access Creation
resource "aws_route" "vpc-httpd-public-route" {
  route_table_id         = aws_route_table.vpc-httpd-public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc-httpd-igw.id
}

# Associate the Route Table with the Subnet
resource "aws_route_table_association" "vpc-httpd-public-route-table-associate" {
  route_table_id = aws_route_table.vpc-httpd-public-route-table.id
  subnet_id      = aws_subnet.vpc-httpd-public-subnet.id
}
