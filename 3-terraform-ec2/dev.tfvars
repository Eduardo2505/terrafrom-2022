instance_type  = "t2.micro"
key_pairs      = "epadilla"
ami_id         = "ami-03e1cddf5b9acd9ad"
tag            = { Name = "docker-app", Evironment = "Dev" }
sg_name        = "sg_daynet"
sg_description = "Este fue creado desde terraform"
ingres_rules = [
  {
    cidr_blocks      = ["0.0.0.0/0", ]
    description      = "ssh"
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 22
  },
  {
    cidr_blocks      = ["0.0.0.0/0", ]
    description      = "appweb"
    from_port        = 80
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 80
  }
]

egress_rules = [
  {
    cidr_blocks      = ["0.0.0.0/0", ]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }
]
private_key         = "epadilla.pem"
type_user_ssh       = "ec2-user"
type_connection_ssh = "ssh"
#var.ssh_inline=[{"docker run hello-world -d"}]