# Databse Subnet, in the private subnet we created for the private subent

resource "aws_db_subnet_group" "database-subnet" {
  name       = "database-subnets"
  subnet_ids = [aws_subnet.private-db-subnet-1.id, aws_subnet.private-db-subnet-2.id]

  tags = {
    Name = "My DB subnet group"
  }
}

#Database configuration instance

resource "aws_db_instance" "database-instance" {
  allocated_storage      = 10
  db_name                = "sqldb"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = "admin"
  password               = "niiadu1212database"
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  availability_zone      = "eu-north-1a"
  db_subnet_group_name   = aws_db_subnet_group.database-subnet.name
  # multi_az               = true
  vpc_security_group_ids = [aws_security_group.Database_security_group.id]
}