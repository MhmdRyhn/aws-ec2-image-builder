variable "profile" {
  type = string
  description = "Name of the AWS profile defined in the shared config file."
}

variable "region" {
  type = string
  default = "eu-west-1"
  description = "Region where to create the AMI."
}

variable "base_ami" {
  type = string
  default = "ami-0dc8d444ee2a42d8a"
  description = "AWS AMI ID."
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "AWS EC2 instance type."
}
