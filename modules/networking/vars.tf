resource "google_compute_subnetwork" "private" {
  count = 2

  name          = "private-${count.index}"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
  network       = google_compute_network.main.id

  private_ip_google_access = true
}


variable "region" {
  description = "The GCP region to deploy resources into"
  type        = string
  default     = "europe-west1"
}