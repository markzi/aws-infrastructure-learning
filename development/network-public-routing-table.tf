resource "aws_route_table" "public" {
  vpc_id = aws_vpc.development.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_subnet_az1.id
  route_table_id = aws_route_table.public.id
}
