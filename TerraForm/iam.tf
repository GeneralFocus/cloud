# resource "google_service_account" "k8s_sa" {
#   account_id = "k8s-service-account"
# }

# resource "google_project_iam_member" "default_service_account_role" {
#   project = "whatthetime"
#   role    = "roles/container.admin"
#   member  = "serviceAccount:${data.google_service_account.existing_k8s_sa.email}"
# }


# Create a new service account
resource "google_service_account" "k8s_sa" {
  account_id   = "k8s-service-account"
  display_name = "K8s Service Account"
}

# Assign the 'roles/container.admin' role to the newly created service account
resource "google_project_iam_member" "default_service_account_role" {
  project = "whatthetime"
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.k8s_sa.email}"
}
