output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnets
}

output "private_subnet_ids" {
  value = module.vpc.private_subnets
}

output "nat_public_ips" {
  value = module.vpc.nat_public_ips
}

output "ssm_parameters" {
  value = concat(
    [aws_ssm_parameter.vpc_id.name],
    aws_ssm_parameter.public_subnets[*].name,
    aws_ssm_parameter.private_subnets[*].name,
  )
}
