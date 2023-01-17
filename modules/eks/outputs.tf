output "endpoint" {
  value       = aws_eks_cluster.terraform_assignment.endpoint
  description = "EKS Cluster endpoint"
}

output "kubeconfig-certificate-authority-data" {
  value       = aws_eks_cluster.terraform_assignment.certificate_authority[0].data
  description = "CA cert for eks cluster"
}

output "eks_cluster_name" {
  value = aws_eks_cluster.terraform_assignment.id
}
