# Main Terraform File (main.tf)


provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "./modules/network"
  vpc_cidr = var.vpc_cidr
}

module "compute" {
  source = "./modules/compute"
  instance_type = var.instance_type
  subnet_id = module.network.subnet_id
}

module "database" {
  source = "./modules/database"
  database_name = var.database_name
  database_username = var.database_username
  database_password = var.database_password
}


module "kinesis" {
  source = "./modules/kinesis"
  // Additional required variables for the kinesis module can be added here
}

module "glue" {
  source = "./modules/glue"
  // Additional required variables for the glue module can be added here
}

module "athena" {
  source = "./modules/athena"
  // Additional required variables for the athena module can be added here
}

module "sagemaker" {
  source = "./modules/sagemaker"
  // Additional required variables for the sagemaker module can be added here
}

module "data_warehouse" {
  source = "./modules/data_warehouse"
  // Additional required variables for the data warehouse module can be added here
}

module "quicksight" {
  source = "./modules/quicksight"
  // Additional required variables for the quicksight module can be added here
}
