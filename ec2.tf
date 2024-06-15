resource "aws_instance" "Public-WebTemplate" {
  ami             = "ami-0705384c0b33c194c" // Ubuntu  AMI
  instance_type   = "t3.micro"
  subnet_id       = aws_subnet.pub-sn-1.id
  security_groups = [aws_security_group.Webserver_security_group.id]
  key_name        = "linux_machine"

  tags = {
    Name = "web-public-1"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update && sudo apt upgrade -y
              sudo apt install nginx -y
              sudo systemctl enable nginx
              sudo -i
              echo "<h1>welcome to Nii Adu personal blog</h1>" > /var/www/html/index.html
              EOF
}


resource "aws_instance" "Private-app-template" {
  ami             = "ami-0705384c0b33c194c" // Ubuntu  AMI
  instance_type   = "t3.micro"
  subnet_id       = aws_subnet.pri-sn-1.id
  security_groups = [aws_security_group.ssh_security_group.id]
  key_name        = "linux_machine"

  tags = {
    Name = "app-private-1"
  }
}