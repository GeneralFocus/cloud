# Define the Google client config data source
data "google_client_config" "default" {}

provider "kubernetes" {
    host                   = "https://${google_container_cluster.primary.endpoint}"
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
}

resource "kubernetes_namespace" "api_namespace" {
  metadata {
    name = "api-namespace"
  }
}

resource "kubernetes_deployment" "api_deployment" {
  metadata {
    name      = "api-deployment"
    namespace = kubernetes_namespace.api_namespace.metadata[0].name
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "api"
      }
    }

    template {
      metadata {
        labels = {
          app = "api"
        }
      }

      spec {
        container {
          name  = "api"
          image = "generalfocus/interview-api:latest"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "api_service" {
  metadata {
    name      = "api-service"
    namespace = kubernetes_namespace.api_namespace.metadata[0].name
  }

  spec {
    selector = {
      app = "api"
    }

    port {
      port        = 80
      target_port  = 80
    }

    type = "LoadBalancer"
  }
}


# provider "kubernetes" {
#   host                   = google_container_cluster.primary.endpoint
#   token                  = data.google_client_config.default.access_token
#   cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
# }



# resource "kubernetes_namespace" "api_namespace" {
#   metadata {
#     name = "api-namespace"
#   }
# }

# resource "kubernetes_deployment" "api_deployment" {
#   metadata {
#     name      = "api-deployment"
#     namespace = kubernetes_namespace.api_namespace.metadata[0].name
#   }

#   spec {
#     replicas = 3

#     selector {
#       match_labels = {
#         app = "api"
#       }
#     }

#     template {
#       metadata {
#         labels = {
#           app = "api"
#         }
#       }

#       spec {
#         container {
#           name  = "api"
#           image = "generalfocus/interview-api:latest"  # Updated Docker image
#           port {
#             container_port = 80
#           }
#         }
#       }
#     }
#   }
# }

# resource "kubernetes_service" "api_service" {
#   metadata {
#     name      = "api-service"
#     namespace = kubernetes_namespace.api_namespace.metadata[0].name
#   }

#   spec {
#     selector = {
#       app = "api"
#     }

#     port {
#       port        = 80
#       target_port  = 80
#     }

#     type = "LoadBalancer"
#   }
# }
