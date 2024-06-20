# Security Group for the database in the private DB subnet, to allow access from the EC2 instances in the private subnet
resource "aws_security_group" "Database_security_group" {
  name        = "Database server Security Group"
  description = "Enable MYSQL access on port 3306"
  vpc_id      = aws_ssm_parameter.vpc-id.value

  ingress {
    description = "MYSQL Access"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    # cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.Webserver_security_group.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Database Security Group"
  }
}