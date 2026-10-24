variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "Região AWS onde a VPC será criada."
}

variable "project_name" {
  type        = string
  default     = "linuxtips"
  description = "Nome usado para prefixar os recursos e o caminho dos parâmetros SSM."
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR da VPC."
}

variable "azs" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  description = "Zonas de disponibilidade (a ordem define os sufixos 1a, 1b, 1c)."
}

variable "public_subnets" {
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  description = "CIDRs das subnets públicas (ALB e NAT Gateway)."
}

variable "private_subnets" {
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
  description = "CIDRs das subnets privadas (tasks do ECS)."
}

variable "single_nat_gateway" {
  type        = bool
  default     = true
  description = "true = 1 NAT Gateway para todas as AZs (mais barato). false = 1 NAT por AZ (alta disponibilidade)."
}

variable "common_tags" {
  type = map(string)
  default = {
    Project     = "linuxtips-sorteador"
    Environment = "production"
    ManagedBy   = "terraform"
  }
  description = "Tags comuns para todos os recursos."
}
