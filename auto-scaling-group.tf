resource "aws_launch_template" "auto-scaling-group" {
  name_prefix   = "auto-scaling-group"
  image_id      = "ami-0705384c0b33c194c"
  instance_type = "t3.micro"
  key_name      = "linux_machine"
  user_data = "${base64encode("./install_nginx.tpl")}"
  network_interfaces {
    subnet_id       = aws_subnet.pub-sn-1.id
    security_groups = [aws_security_group.Webserver_security_group.id]
  }
}

resource "aws_autoscaling_group" "asg-1" {
  availability_zones = ["eu-north-1a"]
  desired_capacity   = 2
  min_size           = 1
  max_size           = 5

  launch_template {
    id      = aws_launch_template.auto-scaling-group.id
    version = "$Latest"
  }
}

# ASG for Application Tier 

resource "aws_launch_template" "auto-scaling-group-private" {
  name_prefix   = "auto-scaling-group-private"
  image_id      = "ami-0705384c0b33c194c"
  instance_type = "t3.micro"
  key_name      = "linux_machine"
  network_interfaces {
    subnet_id       = aws_subnet.pri-sn-1.id
    security_groups = [aws_security_group.ssh_security_group.id]
  }
}

resource "aws_autoscaling_group" "asg-2" {
  availability_zones = ["eu-north-1a"]
  desired_capacity   = 2
  min_size           = 1
  max_size           = 5

  launch_template {
    id      = aws_launch_template.auto-scaling-group-private.id
    version = "$Latest"
  }
}
