# Security Group for our Bastion Host, for ssh access into out instances in the private subnet
resource "aws_security_group" "ssh_security_group" {
  name        = "SSH Access"
  description = "Enable SSH on port 22"
  vpc_id      = aws_ssm_parameter.vpc-id.value

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Application Security Group"
  }
}