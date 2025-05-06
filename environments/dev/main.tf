provider "aws" {
  region = var.region
}

module "vpc" {
  source               = "../../modules/vpc"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = var.azs
  project_name         = var.project_name
}

module "ec2" {
  source            = "../../modules/ec2"
  ami_id            = var.ami_id
  instance_type     = var.ec2_instance_type
  subnet_id         = module.vpc.public_subnet_ids[0]
  key_name          = var.key_name
  security_group_id = aws_security_group.web.id
  project_name      = var.project_name
}

resource "aws_security_group" "web" {
  name        = "web-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "rds" {
  source             = "../../modules/rds"
  db_name            = var.db_name
  db_user            = var.db_user
  db_password        = var.db_password
  private_subnet_ids = module.vpc.private_subnet_ids
  db_sg              = aws_security_group.web.id
  instance_type      = var.rds_instance_type
  project_name       = var.project_name
}
