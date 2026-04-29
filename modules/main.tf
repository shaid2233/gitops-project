module "networking" {
  source = "./networking"
  region = "europe-west1"
  # add other vars here
}

module "eks" {
  source = "./compute/eks"
  # add other vars here
}

module "rds" {
  source = "./compute/rds"
  db_password = var.db_password
}
module "platform" {
  source = "./platform/ecr"
  # add other vars here
}

