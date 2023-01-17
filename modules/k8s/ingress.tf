resource "kubernetes_service_v1" "nginx_ingress_service" {
  metadata {
    name = "ingress-service"
  }
  spec {
    selector = {
      nginx_frontend_deployment = kubernetes_deployment.nginx_frontend_deployment.metadata.0.labels.nginx_frontend_deployment
    }

    port {
      port        = 80
      target_port = 80
      protocol    = "TCP"
    }
    type = "NodePort"
  }
}

resource "kubernetes_ingress_v1" "nginx_ingress" {
  wait_for_load_balancer = true
  metadata {
    name = "nginx"
  }
  spec {
    ingress_class_name = "nginx"
    rule {
      http {
        path {
          path = "/*"
          backend {
            service {
              name = kubernetes_service_v1.nginx_ingress_service.metadata.0.name
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "ingress_controller_deployment" {
  metadata {
    name = "ingress-controller"
    labels = {
      ingrss_controller = "nginx"
    }
  }

  spec {
    selector {
      match_labels = {
        ingrss_controller = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          ingrss_controller = "nginx"
        }
      }

      spec {
        container {
          image = "k8s.gcr.io/ingress-nginx/controller:latest"
          name  = "nginx-ingress-controller"

          args = ["/nginx-ingress-controller"]

          port {
            container_port = 80
            name           = "http"
            protocol       = "TCP"
          }

          port {
            container_port = 443
            name           = "https"
            protocol       = "TCP"
          }

          port {
            container_port = 8443
            name           = "webhook"
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
