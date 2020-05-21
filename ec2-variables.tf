

variable "ami" {
  default = ""
  description = "ami id"
}

variable "instance_type" {
  default = ""
  description = "type of the instance"
}

variable "key_name" {
  default = ""
  description = "name of the key pair"
}

variable "public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
  description = "public key value"
}

variable "subnet_id" {
  default = ""
  description = "id of the subnet"
}

variable "tags" {
  default = {}
  description = "tags to be associated"
}

variable "security_group_name" {
  default = ""
  description = "name of the secuirty group"
}

variable "vpc_id" {
  default = ""
  description = "is of the vpc"
}
