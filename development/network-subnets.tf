# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}

# TODO
# 2 public and 2 private split across 2 availablity zones
resource "aws_subnet" "public_subnet_az1" {
  vpc_id     = aws_vpc.development.id
  cidr_block = "10.0.2.0/24"

  map_public_ip_on_launch = true # true = public subnet, false = private subnet

  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Environment = "development"
    Type        = "public"
    Name        = "public_subnet_az1"
  }
}

resource "aws_subnet" "public_subnet_az2" {
  vpc_id     = aws_vpc.development.id
  cidr_block = "10.0.3.0/24"

  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Environment = "development"
    Type        = "public"
    Name        = "public_subnet_az2"
  }
}

resource "aws_subnet" "private_subnet_az1" {
  vpc_id     = aws_vpc.development.id
  cidr_block = "10.0.0.0/24"

  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Environment = "development"
    Type        = "private"
    Name        = "private_subnet_az1"
  }
}

resource "aws_subnet" "private_subnet_az2" {
  vpc_id     = aws_vpc.development.id
  cidr_block = "10.0.1.0/24"

  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Environment = "development"
    Type        = "private"
    Name        = "private_subnet_az2"
  }
}