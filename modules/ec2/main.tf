resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "${var.project_name}-web"
  }

  vpc_security_group_ids = [var.security_group_id]
}
