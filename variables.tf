variable "name" {
  default = "success"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public-subnet-01-cidr" {
  default = "10.0.1.0/24"
}

variable "public-subent-02-cidr" {
  default = "10.0.2.0/24"
}

variable "private-subent-01-cidr" {
  default = "10.0.3.0/24"
}

variable "private-subent-02-cidr" {
  default = "10.0.4.0/24"
}

variable "private-db-subnet-1-cidr" {
  default = "10.0.5.0/24"
}

variable "private-db-subnet-2-cidr" {
  default = "10.0.6.0/24"
}

variable "database-instance-class" {
  default = "db.t3.micro"
}

variable "multi-az-deployment" {
  default = true
}

variable "lb" {
  default = "App Load balancer"
}

variable "ami" {
  default = "ami-0705384c0b33c194c"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "db-pass" {
  default = "niiadu1212database"
}