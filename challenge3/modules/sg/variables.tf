variable "ingress_rule" {
  type = list(number)
}

variable "egress_rule" {
  type = list(number)
}

variable "web_sg_name" {
  type = string
}
