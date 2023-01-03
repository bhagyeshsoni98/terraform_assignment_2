resource "kubernetes_deployment" "nginx_frontend_deployment" {
  metadata {
    name = "nginx_frontend_deployment"
    labels = {
      nginx_frontend_deployment = "nginx"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        nginx_frontend_deployment = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          nginx_frontend_deployment = "nginx"
        }
      }

      spec {
        container {
          image = "nginx"
          name  = "nginx:latest"

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
                  key      = "kubernetes.io/node-group"
                  operator = "In"
                  values   = ["frontend_node_group"]
                }
              }
            }
          }
        }
      }
    }
  }
}
