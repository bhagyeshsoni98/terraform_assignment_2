resource "kubernetes_horizontal_pod_autoscaler_v1" "nginx_ingress_hpa" {
  metadata {
    name = "nginx_ingress_hpa"
  }

  spec {
    max_replicas = 10
    min_replicas = 8

    scale_target_ref {
      kind = "Deployment"
      name = kubernetes_deployment.nginx_frontend_deployment.metadata.0.name
    }
  }
}
