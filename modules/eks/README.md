## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ec2_capacity_reservation.reserved_instances_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_capacity_reservation) | resource |
| [aws_eks_cluster.terraform_assignment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.backend_node_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_eks_node_group.frontend_node_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_role.eks_custom_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_node_group_custom_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSVPCResourceController](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backend_node_group_instance_types"></a> [backend\_node\_group\_instance\_types](#input\_backend\_node\_group\_instance\_types) | List of backend instance types | `list(string)` | <pre>[<br>  "t2.micro"<br>]</pre> | no |
| <a name="input_backend_node_group_name"></a> [backend\_node\_group\_name](#input\_backend\_node\_group\_name) | Name of backend node group | `string` | `"backend_node_group"` | no |
| <a name="input_backend_scaling_config_vars"></a> [backend\_scaling\_config\_vars](#input\_backend\_scaling\_config\_vars) | Backend node group scaling config vars | <pre>object({<br>    desired_size = number<br>    max_size     = number<br>    min_size     = number<br>  })</pre> | <pre>{<br>  "desired_size": 2,<br>  "max_size": 2,<br>  "min_size": 1<br>}</pre> | no |
| <a name="input_eks_cluster_name"></a> [eks\_cluster\_name](#input\_eks\_cluster\_name) | EKS cluster name | `string` | `"terraform_assignment"` | no |
| <a name="input_frontend_node_group_capacity_type"></a> [frontend\_node\_group\_capacity\_type](#input\_frontend\_node\_group\_capacity\_type) | Capacity type of spot or on-demand for frontend node group instances | `string` | `"SPOT"` | no |
| <a name="input_frontend_node_group_instance_types"></a> [frontend\_node\_group\_instance\_types](#input\_frontend\_node\_group\_instance\_types) | List of frontend instance types | `list(string)` | <pre>[<br>  "t2.micro"<br>]</pre> | no |
| <a name="input_frontend_node_group_name"></a> [frontend\_node\_group\_name](#input\_frontend\_node\_group\_name) | Name of frontend node group | `string` | `"frontend_node_group"` | no |
| <a name="input_frontend_scaling_config_vars"></a> [frontend\_scaling\_config\_vars](#input\_frontend\_scaling\_config\_vars) | Frontend node group scaling config vars | <pre>object({<br>    desired_size = number<br>    max_size     = number<br>    min_size     = number<br>  })</pre> | <pre>{<br>  "desired_size": 2,<br>  "max_size": 2,<br>  "min_size": 1<br>}</pre> | no |
| <a name="input_private_subnet_ids"></a> [private\_subnet\_ids](#input\_private\_subnet\_ids) | List of private ids | `list(string)` | n/a | yes |
| <a name="input_public_subnet_ids"></a> [public\_subnet\_ids](#input\_public\_subnet\_ids) | List of public ids | `list(string)` | n/a | yes |
| <a name="input_reserved_instances_az"></a> [reserved\_instances\_az](#input\_reserved\_instances\_az) | Availability zone for reserved instances | `string` | `"us-east-1a"` | no |
| <a name="input_reserved_instances_platform"></a> [reserved\_instances\_platform](#input\_reserved\_instances\_platform) | Platform for reserved instances | `string` | `"Linux/UNIX"` | no |
| <a name="input_reserved_instances_type"></a> [reserved\_instances\_type](#input\_reserved\_instances\_type) | Instance type for reserved instances | `string` | `"t2.micro"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | EKS Cluster endpoint |
| <a name="output_kubeconfig-certificate-authority-data"></a> [kubeconfig-certificate-authority-data](#output\_kubeconfig-certificate-authority-data) | CA cert for eks cluster |
