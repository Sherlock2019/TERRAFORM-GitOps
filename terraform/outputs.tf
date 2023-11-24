Outputs File (outputs.tf)
This file will define outputs that you might want to use or display after Terraform runs.

```
output "vpc_id" {
  value = module.network.vpc_id
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "ec2_instance_id" {
  value = module.compute.ec2_instance_id
}

output "database_endpoint" {
  value = module.database.database_endpoint
}

# Include outputs for other modules like kinesis, glue, etc.

```







# modules/network/main.tf
```
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr
  availability_zone = var.availability_zone
}

# Additional resources like Internet Gateway, Route Tables, etc.

```
```
