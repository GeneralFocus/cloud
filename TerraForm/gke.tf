# gke.tf
resource "google_container_cluster" "primary" {
  name     = "primary-cluster"
  location = "us-central1-a"

  node_config {
    machine_type = "e2-small"
    oauth_scopes  = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  initial_node_count = 2
}

# # gke.tf
# resource "google_container_cluster" "primary" {
#   name     = "primary-cluster"
#   location = "us-central1"

#   node_config {
#     machine_type = "e2-medium"
#     oauth_scopes  = [
#       "https://www.googleapis.com/auth/cloud-platform",
#     ]
#   }

#   initial_node_count = 3
# }
