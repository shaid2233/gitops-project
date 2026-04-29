locals {
  terraform_service_account = "terraform-sa@project-252f73a6-70da-438f-b12.iam.gserviceaccount.com"
}

provider "google" {
  project                     = "967637022650"
  impersonate_service_account = local.terraform_service_account
}
