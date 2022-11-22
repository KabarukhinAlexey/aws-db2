variable "AWS_REGION" {
  default = "us-west-2"
}

variable "AWS_AVAILABILITY_ZONE" {
  default = ["us-west-2a"]
}

variable "PUBLIC_KEY_PATH" {
    default = "./us-west2-key-pair.pub"
}

variable "environment" {
  default = "testdb2"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "vpc_private_subnets" {
  default = ["10.0.1.0/24"]
}

variable "vpc_public_subnets" {
  default = ["10.0.2.0/24"]
}

