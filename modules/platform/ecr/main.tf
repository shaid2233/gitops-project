provider "google" {
  project = "project-252f73a6-70da-438f-b12"
  region  = "europe-west1"
}

resource "google_artifact_registry_repository" "repo" {
  location      = "europe-west1"
  repository_id = "my-docker-repo"
  format        = "DOCKER"
}