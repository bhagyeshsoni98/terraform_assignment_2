resource "aws_eks_node_group" "frontend_node_group" {
  cluster_name    = aws_eks_cluster.terraform_assignment.name
  node_group_name = var.frontend_node_group_name
  node_role_arn   = aws_iam_role.eks_node_group_custom_role.arn
  subnet_ids      = var.public_subnet_ids
  instance_types  = var.frontend_node_group_instance_types
  capacity_type   = var.frontend_node_group_capacity_type

  labels = {
    "kubernetes.io/node-group" = "frontend_node_group"
  }

  scaling_config {
    desired_size = var.frontend_scaling_config_vars.desired_size
    max_size     = var.frontend_scaling_config_vars.max_size
    min_size     = var.frontend_scaling_config_vars.min_size
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly
  ]
}

resource "aws_eks_node_group" "backend_node_group" {
  cluster_name    = aws_eks_cluster.terraform_assignment.name
  node_group_name = var.backend_node_group_name
  node_role_arn   = aws_iam_role.eks_node_group_custom_role.arn
  subnet_ids      = var.private_subnet_ids
  instance_types  = var.backend_node_group_instance_types

  labels = {
    "kubernetes.io/node-group" = "backend_node_group"
  }

  scaling_config {
    desired_size = var.backend_scaling_config_vars.desired_size
    max_size     = var.backend_scaling_config_vars.max_size
    min_size     = var.backend_scaling_config_vars.min_size
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly
  ]
}

resource "aws_iam_role" "eks_node_group_custom_role" {
  name = "eks_node_group_custom_role"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks_node_group_custom_role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks_node_group_custom_role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks_node_group_custom_role.name
}
