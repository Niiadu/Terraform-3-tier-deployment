resource "aws_route_table" "public-route" {
  vpc_id = aws_ssm_parameter.vpc-id.value

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public-route-Table"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_ssm_parameter.pub-sn-1.value
  route_table_id = aws_route_table.public-route.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_ssm_parameter.pub-sn-2.value
  route_table_id = aws_route_table.public-route.id
}