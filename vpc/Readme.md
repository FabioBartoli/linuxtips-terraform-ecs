# VPC

Cria uma VPC com 3 subnets públicas, 3 privadas e NAT Gateway em us-east-1, e publica os IDs no SSM em `/linuxtips/vpc/`.

## Como usar

No GitHub Actions, rode o workflow com:

- `action`: `apply` (ou `destroy`)
- `working-directory`: `./vpc`

Rode esta stack **antes** do ECS. Para remover, destrua o ECS **primeiro**.

## Parâmetros SSM gerados

- `/platformengineering/vpc/id`
- `/platformengineering/vpc/public-subnet-1a`, `-1b`, `-1c`
- `/platformengineering/vpc/private-subnet-1a`, `-1b`, `-1c`

## Variáveis principais

| Variável | Padrão |
|---|---|
| `vpc_cidr` | `10.0.0.0/16` |
| `project_name` | utilizado para definir o nome do parameter store |
