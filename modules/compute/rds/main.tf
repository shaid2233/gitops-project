# Basic Cloud SQL MySQL instance

resource "google_sql_database_instance" "mysql_basic" {
  name             = "mysql-basic-instance"
  database_version = "MYSQL_8_0"
  region           = var.region

  # Prevent accidental deletion
  deletion_protection = true

  settings {
    tier = "db-f1-micro"  # Smallest tier, good for dev/test

    # Disk configuration
    disk_size       = 10   # GB
    disk_type       = "PD_SSD"
    disk_autoresize = true
    disk_autoresize_limit = 50  # Max GB for auto-resize

    # IP configuration - public IP for development
    ip_configuration {
      ipv4_enabled = true

      authorized_networks {
        name  = "office"
        value = "203.0.113.0/24"
      }
    }
  }
}

# Create a database
resource "google_sql_database" "app_db" {
  name     = "app_database"
  instance = google_sql_database_instance.mysql_basic.name
  charset  = "utf8mb4"
  collation = "utf8mb4_unicode_ci"
}

# Create a user
resource "google_sql_user" "app_user" {
  name     = var.db_username
  instance = google_sql_database_instance.mysql_basic.name
  password = var.db_password
  host     = "%"  # Allow connections from any host
}