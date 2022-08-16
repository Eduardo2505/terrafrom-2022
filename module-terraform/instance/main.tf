terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.26.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_pairs
  vpc_security_group_ids = [aws_security_group.main.id]
  tags                   = var.tag
  connection {
    type        = var.type_connection_ssh
    user        = var.type_user_ssh
    private_key = file(var.private_key)
    host        = self.public_ip
  }
  provisioner "remote-exec" {
    inline = ["sudo docker run --name some-nginx -d -p 80:80 nginx"]
  }
}

resource "aws_security_group" "main" {
  name        = var.sg_name
  description = var.sg_description

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      cidr_blocks      = egress.value.cidr_blocks
      description      = egress.value.description
      from_port        = egress.value.from_port
      ipv6_cidr_blocks = egress.value.ipv6_cidr_blocks
      prefix_list_ids  = egress.value.prefix_list_ids
      protocol         = egress.value.protocol
      security_groups  = egress.value.security_groups
      self             = egress.value.self
      to_port          = egress.value.to_port
    }
  }
  dynamic "ingress" {
    for_each = var.ingres_rules
    content {
      cidr_blocks      = ingress.value.cidr_blocks
      description      = ingress.value.description
      from_port        = ingress.value.from_port
      ipv6_cidr_blocks = ingress.value.ipv6_cidr_blocks
      prefix_list_ids  = ingress.value.prefix_list_ids
      protocol         = ingress.value.protocol
      security_groups  = ingress.value.security_groups
      self             = ingress.value.self
      to_port          = ingress.value.to_port
    }
  }

  tags = {
    Name = "allow_web"
  }

}
