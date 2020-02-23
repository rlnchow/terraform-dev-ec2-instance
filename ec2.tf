data "local_file" "id_rsa_pub" {
  filename = var.public_key
}


data "aws_subnet_ids" "example" {
  vpc_id = var.vpc_id
}

data "aws_subnet" "example" {
  for_each = data.aws_subnet_ids.example.ids
  id       = each.value
}

resource "aws_key_pair" "ec2-keypair" {
  key_name   = "dev-machine-key"
  public_key = data.local_file.id_rsa_pub.content
}

#####################################
# Place holder to insert more rules #
#####################################
#
# module "security-group" {
#   source  = "terraform-aws-modules/security-group/aws"
#   version = "3.4.0"
# 
#   name = "dev-machine-sg"
#   vpc_id = var.vpc_id
# }

module "ssh_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  version = "~> 3.0"

  name                = "dev-machine-sg"
  vpc_id              = var.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
}

module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.12.0"

  name = "dev-machine"

  ami                    = "ami-0a887e401f7654935"
  subnet_ids             = data.aws_subnet_ids.example.ids
  instance_type          = "t2.small"
  vpc_security_group_ids = [module.ssh_security_group.this_security_group_id]
  key_name               = aws_key_pair.ec2-keypair.key_name
}

