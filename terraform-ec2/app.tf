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


module "app-daynet" {
  #source         = "./module/instance"
  source              = "git@gitlab.com:curso_aws_java_devops/module-terraform.git//instance"
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  key_pairs           = var.key_pairs
  tag                 = var.tag
  sg_name             = var.sg_name
  sg_description      = var.sg_description
  ingres_rules        = var.ingres_rules
  egress_rules        = var.egress_rules
  private_key         = var.private_key
  type_connection_ssh = var.type_connection_ssh
  type_user_ssh       = var.type_user_ssh
}

output "module_instance_ip" {
  description = "ID of the EC2 instance"
  value       = module.app-daynet.instance_id
}
output "module_instance_public_ip" {
  description = "ID of the EC2 instance"
  value       = module.app-daynet.instance_public_ip
}
