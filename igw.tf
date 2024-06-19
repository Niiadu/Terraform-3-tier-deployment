resource "aws_internet_gateway" "igw" {
  vpc_id = aws_ssm_parameter.vpc-id.value

  tags = {
    Name = "My-IGW"
  }
}