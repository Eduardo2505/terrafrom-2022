packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}


source "amazon-ebs" "amazon-odoo" {
  ami_name        = "odoo-ami-amazon-{{timestamp}}"
  ami_description = "Odoo Docker"
  instance_type   = "t2.micro"
  region          = "us-east-1"
  #subnet_id       = "subnet-0bf9bf5ffdaa3fc63"
  source_ami              = "ami-090fa75af13c156b4"
  ssh_username            = "ec2-user"
  ssh_agent_auth          = false
  temporary_key_pair_type = "ed25519"
  tags = {
    Name = "odoo Docker"
    Os   = "Amazon Linux 2"
  }
}

build {
  name = "odoo-docker-ami"
  sources = [
    "source.amazon-ebs.amazon-odoo"
  ]
  provisioner "file" {
    source      = "aws-amazon-templete-pkr-hcl"
    destination = "/tmp/aws-amazon-templete-pkr-hcl"
  }

  provisioner "shell" {
    scripts = ["./scripts/instalar-docker.sh"]
  }

}