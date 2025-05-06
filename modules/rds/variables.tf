variable "db_name" {}
variable "db_user" {}
variable "db_password" {}
variable "private_subnet_ids" {
  type = list(string)
}
variable "db_sg" {}
variable "instance_type" {}
variable "project_name" {}
