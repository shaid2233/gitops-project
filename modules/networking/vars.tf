variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for the private subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "azs" {
  type        = list(string)
  description = "Availability zones for the private subnets"
  default     = ["us-east-1a", "us-east-1b"]
}
