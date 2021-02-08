variable "profile" {
  type = string
  description = "Name of the AWS profile defined in the shared config file."
}

variable "region" {
  type = string
  default = "eu-west-1"
  description = "Region where to create the AMI."
}

variable "prefix" {
  type        = string
  description = "A prefix that is to be used with the resource name. Usually, this should be the application name."
}

variable "environment" {
  type        = string
  description = "Environment name, e.g., Dev, Test, Stage, UAT, Prod etc."
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
