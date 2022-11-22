module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name                         = "tf-${var.environment}-vpc"
  cidr                         = var.vpc_cidr
  azs                          = data.aws_availability_zones.available.names
  public_subnets               = var.vpc_public_subnets
  enable_nat_gateway           = true
  single_nat_gateway           = true
  enable_dns_hostnames         = true
  default_vpc_enable_dns_hostnames =  true
  default_vpc_enable_dns_support =  true
  enable_dhcp_options  =  true
  enable_dns_support  = true
}
