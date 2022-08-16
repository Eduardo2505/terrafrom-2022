variable "ami_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."

}

variable "instance_type" {
  type        = string
  description = "Type Instance"
  default     = "t2.micro"
}

variable "key_pairs" {
  type        = string
  description = "Key pairs "
}

variable "tag" {
  type        = map(any)
  description = "tag"
}

variable "sg_name" {
  type        = string
  description = "segurity crud "
}
variable "sg_description" {
  type        = string
  description = "Sg_description "
}

variable "ingres_rules" {
  type        = list(any)
  description = "ingres_rules"
}

variable "egress_rules" {
  type        = list(any)
  description = "egress_rules"
}

variable "private_key" {
  type        = string
  description = "archivo epadilla.pem"
}

variable "type_connection_ssh" {
  type        = string
  description = "type_connection"
}

variable "type_user_ssh" {
  type        = string
  description = "type_user"
}