resource "kubernetes_service_v1" "backend_elb" {
  wait_for_load_balancer = true

  metadata {
    name = "backend-elb"
  }

  spec {
    selector = {
      apache_backend_deployment = kubernetes_deployment.apache_backend_deployment.metadata.0.labels.apache_backend_deployment
    }

    port {
      port        = 8080
      target_port = 80
    }
    type = "LoadBalancer"
  }
}
