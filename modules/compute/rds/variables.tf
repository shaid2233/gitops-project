variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "db_username" {
  description = "Database username"
  type        = string
  default     = "app_user"
}

variable "region" {
  description = "The GCP region to deploy resources into"
  type        = string
  default     = "europe-west1"
}