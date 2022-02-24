variable "ami" {
  type = string
}

variable "server_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "user_data" {
  type    = string
  default = ""
}

variable "security_groups" {
  type    = list(string)
  default = ["default"]
}
