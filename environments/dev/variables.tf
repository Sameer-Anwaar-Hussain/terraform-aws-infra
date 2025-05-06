variable "region" {}
variable "vpc_cidr" {}
variable "public_subnet_cidrs" {
  type = list(string)
}
variable "private_subnet_cidrs" {
  type = list(string)
}
variable "azs" {
  type = list(string)
}
variable "project_name" {}
variable "ami_id" {}
variable "ec2_instance_type" {}
variable "key_name" {}
variable "db_name" {}
variable "db_user" {}
variable "db_password" {}
variable "rds_instance_type" {}
