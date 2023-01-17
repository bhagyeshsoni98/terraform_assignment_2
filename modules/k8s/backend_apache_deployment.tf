resource "kubernetes_deployment" "apache_backend_deployment" {
  metadata {
    name = "apache-backend-deployment"
    labels = {
      apache_backend_deployment = "apache"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        apache_backend_deployment = "apache"
      }
    }

    template {
      metadata {
        labels = {
          apache_backend_deployment = "apache"
        }
      }

      spec {
        container {
          image = "apache:latest"
          name  = "apache"

          port {
            container_port = 80
            name           = "http"
            protocol       = "TCP"
          }
        }

        affinity {
          node_affinity {
            required_during_scheduling_ignored_during_execution {
              node_selector_term {
                match_expressions {
                  key      = "kube.io/node-group"
                  operator = "In"
                  values   = ["backend_node_group"]
                }
              }
            }
          }
        }
      }
    }
  }
}
