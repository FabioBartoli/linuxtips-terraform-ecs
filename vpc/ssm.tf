
locals {
  ssm_prefix = "/${var.project_name}/vpc"

  # Sufixo de cada AZ: us-east-1a -> 1a, us-east-1b -> 1b, ...
  az_suffixes = [for az in var.azs : substr(az, length(az) - 2, 2)]
}

resource "aws_ssm_parameter" "vpc_id" {
  name  = "${local.ssm_prefix}/id"
  type  = "String"
  value = module.vpc.vpc_id
}

resource "aws_ssm_parameter" "public_subnets" {
  count = length(var.azs)

  name  = "${local.ssm_prefix}/public-subnet-${local.az_suffixes[count.index]}"
  type  = "String"
  value = module.vpc.public_subnets[count.index]
}

resource "aws_ssm_parameter" "private_subnets" {
  count = length(var.azs)

  name  = "${local.ssm_prefix}/private-subnet-${local.az_suffixes[count.index]}"
  type  = "String"
  value = module.vpc.private_subnets[count.index]
}
