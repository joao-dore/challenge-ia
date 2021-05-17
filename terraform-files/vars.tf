variable "amis" {
  type = map(string)
  default = {
    "us-east-1" = "ami-09e67e426f25ce0d7"
  }
}

variable "key_name" {
  default = "challenge-aws"
}

variable "cidr_block" {
  default = "172.31.0.0/16"
}