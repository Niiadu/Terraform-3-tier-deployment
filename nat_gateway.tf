# Elastic IP  for the NAT gateway
resource "aws_eip" "eip-nat" {
  domain = "vpc"
}

# NAT gateway for the private instances to have access to the internet
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.eip-nat.id
  subnet_id     = aws_ssm_parameter.pub-sn-2.value

  tags = {
    Name = "Nat GW"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
    depends_on = [aws_internet_gateway.igw]
}