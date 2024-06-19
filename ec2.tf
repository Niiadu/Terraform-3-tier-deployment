resource "aws_instance" "Public-WebTemplate" {
  ami             = "ami-0705384c0b33c194c" // Ubuntu  AMI
  instance_type   = "t3.micro"
  subnet_id       = aws_ssm_parameter.pub-sn-1.value
  security_groups = [aws_security_group.alb_security_group.id]
  key_name        = "linux_machine"

  tags = {
    Name = "web-public-1"
  }
}


# resource "aws_instance" "Private-app-template" {
#   ami             = "ami-0705384c0b33c194c" // Ubuntu  AMI
#   instance_type   = "t3.micro"
#   subnet_id       = aws_ssm_parameter.pri-sn-1.value
#   security_groups = [aws_security_group.ssh_security_group.id]
#   key_name        = "linux_machine"

#   tags = {
#     Name = "app-private-1"
#   }
# }