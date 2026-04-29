# -----------------------------
# VPC
# -----------------------------
resource "google_compute_network" "main" {
  name                    = "main-vpc"
  auto_create_subnetworks = false
}

# -----------------------------
# Public Subnet
# -----------------------------
resource "google_compute_subnetwork" "public_subnet" {
  name          = "public-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
  network       = google_compute_network.main.id
}

# -----------------------------
# Private Subnet
# -----------------------------
resource "google_compute_subnetwork" "private_subnet" {
  name          = "private-subnet"
  ip_cidr_range = var.google_compute_subnetwork.private_subnet_cidr
  region        = var.region
  network       = google_compute_network.main.id

  private_ip_google_access = true
}

# -----------------------------
# Cloud Router
# -----------------------------
resource "google_compute_router" "router" {
  name    = "main-router"
  region  = var.region
  network = google_compute_network.main.id
}

# -----------------------------
# NAT Gateway (Cloud NAT)
# -----------------------------
resource "google_compute_router_nat" "nat" {
  name                               = "main-nat"
  router                             = google_compute_router.router.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

# -----------------------------
# Firewall Rule (Internet Inbound)
# -----------------------------
resource "google_compute_firewall" "allow_ssh_http" {
  name    = "allow-ssh-http"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}