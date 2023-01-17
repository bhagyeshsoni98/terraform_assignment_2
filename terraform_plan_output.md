## **Terraform plan output**

```bash
bhagyesh@BHAGYESH-SONI:~/pip_assignments/citadel_assignment/terraform_assignment_2$ terraform plan
module.vpc.data.aws_availability_zones.available: Reading...
module.vpc.data.aws_availability_zones.available: Read complete after 2s [id=us-east-1]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create
 <= read (data resources)

Terraform will perform the following actions:

  # data.aws_eks_cluster_auth.eks_cluster will be read during apply
  # (config refers to values not yet known)
 <= data "aws_eks_cluster_auth" "eks_cluster" {
      + id    = (known after apply)
      + name  = (known after apply)
      + token = (sensitive value)
    }

  # module.eks.aws_ec2_capacity_reservation.reserved_instances_policy will be created
  + resource "aws_ec2_capacity_reservation" "reserved_instances_policy" {
      + arn                     = (known after apply)
      + availability_zone       = "us-east-1a"
      + ebs_optimized           = false
      + end_date_type           = "unlimited"
      + ephemeral_storage       = false
      + id                      = (known after apply)
      + instance_count          = 2
      + instance_match_criteria = "open"
      + instance_platform       = "Linux/UNIX"
      + instance_type           = "t2.micro"
      + owner_id                = (known after apply)
      + tags_all                = {
          + "Owner"                                      = "Bhagyesh Soni"
          + "kubernetes.io/cluster/terraform_assignment" = "owned"
        }
      + tenancy                 = "default"
    }

  # module.eks.aws_eks_cluster.terraform_assignment will be created
  + resource "aws_eks_cluster" "terraform_assignment" {
      + arn                   = (known after apply)
      + certificate_authority = (known after apply)
      + cluster_id            = (known after apply)
      + created_at            = (known after apply)
      + endpoint              = (known after apply)
      + id                    = (known after apply)
      + identity              = (known after apply)
      + name                  = "terraform_assignment"
      + platform_version      = (known after apply)
      + role_arn              = (known after apply)
      + status                = (known after apply)
      + tags_all              = {
          + "Owner"                                      = "Bhagyesh Soni"
          + "kubernetes.io/cluster/terraform_assignment" = "owned"
        }
      + version               = (known after apply)

      + kubernetes_network_config {
          + ip_family         = (known after apply)
          + service_ipv4_cidr = (known after apply)
          + service_ipv6_cidr = (known after apply)
        }

      + vpc_config {
          + cluster_security_group_id = (known after apply)
          + endpoint_private_access   = false
          + endpoint_public_access    = true
          + public_access_cidrs       = (known after apply)
          + subnet_ids                = (known after apply)
          + vpc_id                    = (known after apply)
        }
    }

  # module.eks.aws_eks_node_group.backend_node_group will be created
  + resource "aws_eks_node_group" "backend_node_group" {
      + ami_type               = (known after apply)
      + arn                    = (known after apply)
      + capacity_type          = (known after apply)
      + cluster_name           = "terraform_assignment"
      + disk_size              = (known after apply)
      + id                     = (known after apply)
      + instance_types         = [
          + "t2.micro",
        ]
      + labels                 = {
          + "kube.io/node-group" = "backend_node_group"
        }
      + node_group_name        = "backend_node_group"
      + node_group_name_prefix = (known after apply)
      + node_role_arn          = (known after apply)
      + release_version        = (known after apply)
      + resources              = (known after apply)
      + status                 = (known after apply)
      + subnet_ids             = (known after apply)
      + tags_all               = {
          + "Owner"                                      = "Bhagyesh Soni"
          + "kubernetes.io/cluster/terraform_assignment" = "owned"
        }
      + version                = (known after apply)

      + scaling_config {
          + desired_size = 2
          + max_size     = 2
          + min_size     = 1
        }

      + update_config {
          + max_unavailable = 1
        }
    }

  # module.eks.aws_eks_node_group.frontend_node_group will be created
  + resource "aws_eks_node_group" "frontend_node_group" {
      + ami_type               = (known after apply)
      + arn                    = (known after apply)
      + capacity_type          = "SPOT"
      + cluster_name           = "terraform_assignment"
      + disk_size              = (known after apply)
      + id                     = (known after apply)
      + instance_types         = [
          + "t2.micro",
        ]
      + labels                 = {
          + "kube.io/node-group" = "frontend_node_group"
        }
      + node_group_name        = "frontend_node_group"
      + node_group_name_prefix = (known after apply)
      + node_role_arn          = (known after apply)
      + release_version        = (known after apply)
      + resources              = (known after apply)
      + status                 = (known after apply)
      + subnet_ids             = (known after apply)
      + tags_all               = {
          + "Owner"                                      = "Bhagyesh Soni"
          + "kubernetes.io/cluster/terraform_assignment" = "owned"
        }
      + version                = (known after apply)

      + scaling_config {
          + desired_size = 2
          + max_size     = 2
          + min_size     = 1
        }

      + update_config {
          + max_unavailable = 1
        }
    }

  # module.eks.aws_iam_role.eks_custom_role will be created
  + resource "aws_iam_role" "eks_custom_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "eks.amazonaws.com"
                        }
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "eks_custom_role"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags_all              = {
          + "Owner"                                      = "Bhagyesh Soni"
          + "kubernetes.io/cluster/terraform_assignment" = "owned"
        }
      + unique_id             = (known after apply)

      + inline_policy {
          + name   = (known after apply)
          + policy = (known after apply)
        }
    }

  # module.eks.aws_iam_role.eks_node_group_custom_role will be created
  + resource "aws_iam_role" "eks_node_group_custom_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "ec2.amazonaws.com"
                        }
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "eks_node_group_custom_role"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags_all              = {
          + "Owner"                                      = "Bhagyesh Soni"
          + "kubernetes.io/cluster/terraform_assignment" = "owned"
        }
      + unique_id             = (known after apply)

      + inline_policy {
          + name   = (known after apply)
          + policy = (known after apply)
        }
    }

  # module.eks.aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly will be created
  + resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
      + role       = "eks_node_group_custom_role"
    }

  # module.eks.aws_iam_role_policy_attachment.AmazonEKSClusterPolicy will be created
  + resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
      + role       = "eks_custom_role"
    }

  # module.eks.aws_iam_role_policy_attachment.AmazonEKSVPCResourceController will be created
  + resource "aws_iam_role_policy_attachment" "AmazonEKSVPCResourceController" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
      + role       = "eks_custom_role"
    }

  # module.eks.aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy will be created
  + resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
      + role       = "eks_node_group_custom_role"
    }

  # module.eks.aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy will be created
  + resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
      + role       = "eks_node_group_custom_role"
    }

  # module.k8s.kubernetes_deployment.apache_backend_deployment will be created
  + resource "kubernetes_deployment" "apache_backend_deployment" {
      + id               = (known after apply)
      + wait_for_rollout = true

      + metadata {
          + generation       = (known after apply)
          + labels           = {
              + "apache_backend_deployment" = "apache"
            }
          + name             = "apache-backend-deployment"
          + namespace        = "default"
          + resource_version = (known after apply)
          + uid              = (known after apply)
        }

      + spec {
          + min_ready_seconds         = 0
          + paused                    = false
          + progress_deadline_seconds = 600
          + replicas                  = "3"
          + revision_history_limit    = 10

          + selector {
              + match_labels = {
                  + "apache_backend_deployment" = "apache"
                }
            }

          + strategy {
              + type = (known after apply)

              + rolling_update {
                  + max_surge       = (known after apply)
                  + max_unavailable = (known after apply)
                }
            }

          + template {
              + metadata {
                  + generation       = (known after apply)
                  + labels           = {
                      + "apache_backend_deployment" = "apache"
                    }
                  + name             = (known after apply)
                  + resource_version = (known after apply)
                  + uid              = (known after apply)
                }

              + spec {
                  + automount_service_account_token  = true
                  + dns_policy                       = "ClusterFirst"
                  + enable_service_links             = true
                  + host_ipc                         = false
                  + host_network                     = false
                  + host_pid                         = false
                  + hostname                         = (known after apply)
                  + node_name                        = (known after apply)
                  + restart_policy                   = "Always"
                  + service_account_name             = (known after apply)
                  + share_process_namespace          = false
                  + termination_grace_period_seconds = 30

                  + affinity {
                      + node_affinity {

                          + required_during_scheduling_ignored_during_execution {
                              + node_selector_term {
                                  + match_expressions {
                                      + key      = "kube.io/node-group"
                                      + operator = "In"
                                      + values   = [
                                          + "backend_node_group",
                                        ]
                                    }
                                }
                            }
                        }
                    }

                  + container {
                      + image                      = "apache:latest"
                      + image_pull_policy          = (known after apply)
                      + name                       = "apache"
                      + stdin                      = false
                      + stdin_once                 = false
                      + termination_message_path   = "/dev/termination-log"
                      + termination_message_policy = (known after apply)
                      + tty                        = false

                      + port {
                          + container_port = 80
                          + name           = "http"
                          + protocol       = "TCP"
                        }

                      + resources {
                          + limits   = (known after apply)
                          + requests = (known after apply)
                        }
                    }

                  + image_pull_secrets {
                      + name = (known after apply)
                    }

                  + readiness_gate {
                      + condition_type = (known after apply)
                    }

                  + volume {
                      + name = (known after apply)

                      + aws_elastic_block_store {
                          + fs_type   = (known after apply)
                          + partition = (known after apply)
                          + read_only = (known after apply)
                          + volume_id = (known after apply)
                        }

                      + azure_disk {
                          + caching_mode  = (known after apply)
                          + data_disk_uri = (known after apply)
                          + disk_name     = (known after apply)
                          + fs_type       = (known after apply)
                          + kind          = (known after apply)
                          + read_only     = (known after apply)
                        }

                      + azure_file {
                          + read_only        = (known after apply)
                          + secret_name      = (known after apply)
                          + secret_namespace = (known after apply)
                          + share_name       = (known after apply)
                        }

                      + ceph_fs {
                          + monitors    = (known after apply)
                          + path        = (known after apply)
                          + read_only   = (known after apply)
                          + secret_file = (known after apply)
                          + user        = (known after apply)

                          + secret_ref {
                              + name      = (known after apply)
                              + namespace = (known after apply)
                            }
                        }

                      + cinder {
                          + fs_type   = (known after apply)
                          + read_only = (known after apply)
                          + volume_id = (known after apply)
                        }

                      + config_map {
                          + default_mode = (known after apply)
                          + name         = (known after apply)
                          + optional     = (known after apply)

                          + items {
                              + key  = (known after apply)
                              + mode = (known after apply)
                              + path = (known after apply)
                            }
                        }

                      + csi {
                          + driver            = (known after apply)
                          + fs_type           = (known after apply)
                          + read_only         = (known after apply)
                          + volume_attributes = (known after apply)

                          + node_publish_secret_ref {
                              + name = (known after apply)
                            }
                        }

                      + downward_api {
                          + default_mode = (known after apply)

                          + items {
                              + mode = (known after apply)
                              + path = (known after apply)

                              + field_ref {
                                  + api_version = (known after apply)
                                  + field_path  = (known after apply)
                                }

                              + resource_field_ref {
                                  + container_name = (known after apply)
                                  + divisor        = (known after apply)
                                  + resource       = (known after apply)
                                }
                            }
                        }

                      + empty_dir {
                          + medium     = (known after apply)
                          + size_limit = (known after apply)
                        }

                      + fc {
                          + fs_type      = (known after apply)
                          + lun          = (known after apply)
                          + read_only    = (known after apply)
                          + target_ww_ns = (known after apply)
                        }

                      + flex_volume {
                          + driver    = (known after apply)
                          + fs_type   = (known after apply)
                          + options   = (known after apply)
                          + read_only = (known after apply)

                          + secret_ref {
                              + name      = (known after apply)
                              + namespace = (known after apply)
                            }
                        }

                      + flocker {
                          + dataset_name = (known after apply)
                          + dataset_uuid = (known after apply)
                        }

                      + gce_persistent_disk {
                          + fs_type   = (known after apply)
                          + partition = (known after apply)
                          + pd_name   = (known after apply)
                          + read_only = (known after apply)
                        }

                      + git_repo {
                          + directory  = (known after apply)
                          + repository = (known after apply)
                          + revision   = (known after apply)
                        }

                      + glusterfs {
                          + endpoints_name = (known after apply)
                          + path           = (known after apply)
                          + read_only      = (known after apply)
                        }

                      + host_path {
                          + path = (known after apply)
                          + type = (known after apply)
                        }

                      + iscsi {
                          + fs_type         = (known after apply)
                          + iqn             = (known after apply)
                          + iscsi_interface = (known after apply)
                          + lun             = (known after apply)
                          + read_only       = (known after apply)
                          + target_portal   = (known after apply)
                        }

                      + local {
                          + path = (known after apply)
                        }

                      + nfs {
                          + path      = (known after apply)
                          + read_only = (known after apply)
                          + server    = (known after apply)
                        }

                      + persistent_volume_claim {
                          + claim_name = (known after apply)
                          + read_only  = (known after apply)
                        }

                      + photon_persistent_disk {
                          + fs_type = (known after apply)
                          + pd_id   = (known after apply)
                        }

                      + projected {
                          + default_mode = (known after apply)

                          + sources {
                              + config_map {
                                  + name     = (known after apply)
                                  + optional = (known after apply)

                                  + items {
                                      + key  = (known after apply)
                                      + mode = (known after apply)
                                      + path = (known after apply)
                                    }
                                }

                              + downward_api {
                                  + items {
                                      + mode = (known after apply)
                                      + path = (known after apply)

                                      + field_ref {
                                          + api_version = (known after apply)
                                          + field_path  = (known after apply)
                                        }

                                      + resource_field_ref {
                                          + container_name = (known after apply)
                                          + divisor        = (known after apply)
                                          + resource       = (known after apply)
                                        }
                                    }
                                }

                              + secret {
                                  + name     = (known after apply)
                                  + optional = (known after apply)

                                  + items {
                                      + key  = (known after apply)
                                      + mode = (known after apply)
                                      + path = (known after apply)
                                    }
                                }

                              + service_account_token {
                                  + audience           = (known after apply)
                                  + expiration_seconds = (known after apply)
                                  + path               = (known after apply)
                                }
                            }
                        }

                      + quobyte {
                          + group     = (known after apply)
                          + read_only = (known after apply)
                          + registry  = (known after apply)
                          + user      = (known after apply)
                          + volume    = (known after apply)
                        }

                      + rbd {
                          + ceph_monitors = (known after apply)
                          + fs_type       = (known after apply)
                          + keyring       = (known after apply)
                          + rados_user    = (known after apply)
                          + rbd_image     = (known after apply)
                          + rbd_pool      = (known after apply)
                          + read_only     = (known after apply)

                          + secret_ref {
                              + name      = (known after apply)
                              + namespace = (known after apply)
                            }
                        }

                      + secret {
                          + default_mode = (known after apply)
                          + optional     = (known after apply)
                          + secret_name  = (known after apply)

                          + items {
                              + key  = (known after apply)
                              + mode = (known after apply)
                              + path = (known after apply)
                            }
                        }

                      + vsphere_volume {
                          + fs_type     = (known after apply)
                          + volume_path = (known after apply)
                        }
                    }
                }
            }
        }
    }

  # module.k8s.kubernetes_deployment.ingress_controller_deployment will be created
  + resource "kubernetes_deployment" "ingress_controller_deployment" {
      + id               = (known after apply)
      + wait_for_rollout = true

      + metadata {
          + generation       = (known after apply)
          + labels           = {
              + "ingrss_controller" = "nginx"
            }
          + name             = "ingress-controller"
          + namespace        = "default"
          + resource_version = (known after apply)
          + uid              = (known after apply)
        }

      + spec {
          + min_ready_seconds         = 0
          + paused                    = false
          + progress_deadline_seconds = 600
          + replicas                  = (known after apply)
          + revision_history_limit    = 10

          + selector {
              + match_labels = {
                  + "ingrss_controller" = "nginx"
                }
            }

          + strategy {
              + type = (known after apply)

              + rolling_update {
                  + max_surge       = (known after apply)
                  + max_unavailable = (known after apply)
                }
            }

          + template {
              + metadata {
                  + generation       = (known after apply)
                  + labels           = {
                      + "ingrss_controller" = "nginx"
                    }
                  + name             = (known after apply)
                  + resource_version = (known after apply)
                  + uid              = (known after apply)
                }

              + spec {
                  + automount_service_account_token  = true
                  + dns_policy                       = "ClusterFirst"
                  + enable_service_links             = true
                  + host_ipc                         = false
                  + host_network                     = false
                  + host_pid                         = false
                  + hostname                         = (known after apply)
                  + node_name                        = (known after apply)
                  + restart_policy                   = "Always"
                  + service_account_name             = (known after apply)
                  + share_process_namespace          = false
                  + termination_grace_period_seconds = 30

                  + affinity {
                      + node_affinity {

                          + required_during_scheduling_ignored_during_execution {
                              + node_selector_term {
                                  + match_expressions {
                                      + key      = "kube.io/node-group"
                                      + operator = "In"
                                      + values   = [
                                          + "frontend_node_group",
                                        ]
                                    }
                                }
                            }
                        }
                    }

                  + container {
                      + args                       = [
                          + "/nginx-ingress-controller",
                        ]
                      + image                      = "k8s.gcr.io/ingress-nginx/controller:latest"
                      + image_pull_policy          = (known after apply)
                      + name                       = "nginx-ingress-controller"
                      + stdin                      = false
                      + stdin_once                 = false
                      + termination_message_path   = "/dev/termination-log"
                      + termination_message_policy = (known after apply)
                      + tty                        = false

                      + port {
                          + container_port = 80
                          + name           = "http"
                          + protocol       = "TCP"
                        }
                      + port {
                          + container_port = 443
                          + name           = "https"
                          + protocol       = "TCP"
                        }
                      + port {
                          + container_port = 8443
                          + name           = "webhook"
                          + protocol       = "TCP"
                        }

                      + resources {
                          + limits   = (known after apply)
                          + requests = (known after apply)
                        }
                    }

                  + image_pull_secrets {
                      + name = (known after apply)
                    }

                  + readiness_gate {
                      + condition_type = (known after apply)
                    }

                  + volume {
                      + name = (known after apply)

                      + aws_elastic_block_store {
                          + fs_type   = (known after apply)
                          + partition = (known after apply)
                          + read_only = (known after apply)
                          + volume_id = (known after apply)
                        }

                      + azure_disk {
                          + caching_mode  = (known after apply)
                          + data_disk_uri = (known after apply)
                          + disk_name     = (known after apply)
                          + fs_type       = (known after apply)
                          + kind          = (known after apply)
                          + read_only     = (known after apply)
                        }

                      + azure_file {
                          + read_only        = (known after apply)
                          + secret_name      = (known after apply)
                          + secret_namespace = (known after apply)
                          + share_name       = (known after apply)
                        }

                      + ceph_fs {
                          + monitors    = (known after apply)
                          + path        = (known after apply)
                          + read_only   = (known after apply)
                          + secret_file = (known after apply)
                          + user        = (known after apply)

                          + secret_ref {
                              + name      = (known after apply)
                              + namespace = (known after apply)
                            }
                        }

                      + cinder {
                          + fs_type   = (known after apply)
                          + read_only = (known after apply)
                          + volume_id = (known after apply)
                        }

                      + config_map {
                          + default_mode = (known after apply)
                          + name         = (known after apply)
                          + optional     = (known after apply)

                          + items {
                              + key  = (known after apply)
                              + mode = (known after apply)
                              + path = (known after apply)
                            }
                        }

                      + csi {
                          + driver            = (known after apply)
                          + fs_type           = (known after apply)
                          + read_only         = (known after apply)
                          + volume_attributes = (known after apply)

                          + node_publish_secret_ref {
                              + name = (known after apply)
                            }
                        }

                      + downward_api {
                          + default_mode = (known after apply)

                          + items {
                              + mode = (known after apply)
                              + path = (known after apply)

                              + field_ref {
                                  + api_version = (known after apply)
                                  + field_path  = (known after apply)
                                }

                              + resource_field_ref {
                                  + container_name = (known after apply)
                                  + divisor        = (known after apply)
                                  + resource       = (known after apply)
                                }
                            }
                        }

                      + empty_dir {
                          + medium     = (known after apply)
                          + size_limit = (known after apply)
                        }

                      + fc {
                          + fs_type      = (known after apply)
                          + lun          = (known after apply)
                          + read_only    = (known after apply)
                          + target_ww_ns = (known after apply)
                        }

                      + flex_volume {
                          + driver    = (known after apply)
                          + fs_type   = (known after apply)
                          + options   = (known after apply)
                          + read_only = (known after apply)

                          + secret_ref {
                              + name      = (known after apply)
                              + namespace = (known after apply)
                            }
                        }

                      + flocker {
                          + dataset_name = (known after apply)
                          + dataset_uuid = (known after apply)
                        }

                      + gce_persistent_disk {
                          + fs_type   = (known after apply)
                          + partition = (known after apply)
                          + pd_name   = (known after apply)
                          + read_only = (known after apply)
                        }

                      + git_repo {
                          + directory  = (known after apply)
                          + repository = (known after apply)
                          + revision   = (known after apply)
                        }

                      + glusterfs {
                          + endpoints_name = (known after apply)
                          + path           = (known after apply)
                          + read_only      = (known after apply)
                        }

                      + host_path {
                          + path = (known after apply)
                          + type = (known after apply)
                        }

                      + iscsi {
                          + fs_type         = (known after apply)
                          + iqn             = (known after apply)
                          + iscsi_interface = (known after apply)
                          + lun             = (known after apply)
                          + read_only       = (known after apply)
                          + target_portal   = (known after apply)
                        }

                      + local {
                          + path = (known after apply)
                        }

                      + nfs {
                          + path      = (known after apply)
                          + read_only = (known after apply)
                          + server    = (known after apply)
                        }

                      + persistent_volume_claim {
                          + claim_name = (known after apply)
                          + read_only  = (known after apply)
                        }

                      + photon_persistent_disk {
                          + fs_type = (known after apply)
                          + pd_id   = (known after apply)
                        }

                      + projected {
                          + default_mode = (known after apply)

                          + sources {
                              + config_map {
                                  + name     = (known after apply)
                                  + optional = (known after apply)

                                  + items {
                                      + key  = (known after apply)
                                      + mode = (known after apply)
                                      + path = (known after apply)
                                    }
                                }

                              + downward_api {
                                  + items {
                                      + mode = (known after apply)
                                      + path = (known after apply)

                                      + field_ref {
                                          + api_version = (known after apply)
                                          + field_path  = (known after apply)
                                        }

                                      + resource_field_ref {
                                          + container_name = (known after apply)
                                          + divisor        = (known after apply)
                                          + resource       = (known after apply)
                                        }
                                    }
                                }

                              + secret {
                                  + name     = (known after apply)
                                  + optional = (known after apply)

                                  + items {
                                      + key  = (known after apply)
                                      + mode = (known after apply)
                                      + path = (known after apply)
                                    }
                                }

                              + service_account_token {
                                  + audience           = (known after apply)
                                  + expiration_seconds = (known after apply)
                                  + path               = (known after apply)
                                }
                            }
                        }

                      + quobyte {
                          + group     = (known after apply)
                          + read_only = (known after apply)
                          + registry  = (known after apply)
                          + user      = (known after apply)
                          + volume    = (known after apply)
                        }

                      + rbd {
                          + ceph_monitors = (known after apply)
                          + fs_type       = (known after apply)
                          + keyring       = (known after apply)
                          + rados_user    = (known after apply)
                          + rbd_image     = (known after apply)
                          + rbd_pool      = (known after apply)
                          + read_only     = (known after apply)

                          + secret_ref {
                              + name      = (known after apply)
                              + namespace = (known after apply)
                            }
                        }

                      + secret {
                          + default_mode = (known after apply)
                          + optional     = (known after apply)
                          + secret_name  = (known after apply)

                          + items {
                              + key  = (known after apply)
                              + mode = (known after apply)
                              + path = (known after apply)
                            }
                        }

                      + vsphere_volume {
                          + fs_type     = (known after apply)
                          + volume_path = (known after apply)
                        }
                    }
                }
            }
        }
    }

  # module.k8s.kubernetes_deployment.nginx_frontend_deployment will be created
  + resource "kubernetes_deployment" "nginx_frontend_deployment" {
      + id               = (known after apply)
      + wait_for_rollout = true

      + metadata {
          + generation       = (known after apply)
          + labels           = {
              + "nginx_frontend_deployment" = "nginx"
            }
          + name             = "nginx-frontend-deployment"
          + namespace        = "default"
          + resource_version = (known after apply)
          + uid              = (known after apply)
        }

      + spec {
          + min_ready_seconds         = 0
          + paused                    = false
          + progress_deadline_seconds = 600
          + replicas                  = "3"
          + revision_history_limit    = 10

          + selector {
              + match_labels = {
                  + "nginx_frontend_deployment" = "nginx"
                }
            }

          + strategy {
              + type = (known after apply)

              + rolling_update {
                  + max_surge       = (known after apply)
                  + max_unavailable = (known after apply)
                }
            }

          + template {
              + metadata {
                  + generation       = (known after apply)
                  + labels           = {
                      + "nginx_frontend_deployment" = "nginx"
                    }
                  + name             = (known after apply)
                  + resource_version = (known after apply)
                  + uid              = (known after apply)
                }

              + spec {
                  + automount_service_account_token  = true
                  + dns_policy                       = "ClusterFirst"
                  + enable_service_links             = true
                  + host_ipc                         = false
                  + host_network                     = false
                  + host_pid                         = false
                  + hostname                         = (known after apply)
                  + node_name                        = (known after apply)
                  + restart_policy                   = "Always"
                  + service_account_name             = (known after apply)
                  + share_process_namespace          = false
                  + termination_grace_period_seconds = 30

                  + affinity {
                      + node_affinity {

                          + required_during_scheduling_ignored_during_execution {
                              + node_selector_term {
                                  + match_expressions {
                                      + key      = "kube.io/node-group"
                                      + operator = "In"
                                      + values   = [
                                          + "frontend_node_group",
                                        ]
                                    }
                                }
                            }
                        }
                    }

                  + container {
                      + image                      = "nginx:latest"
                      + image_pull_policy          = (known after apply)
                      + name                       = "nginx"
                      + stdin                      = false
                      + stdin_once                 = false
                      + termination_message_path   = "/dev/termination-log"
                      + termination_message_policy = (known after apply)
                      + tty                        = false

                      + port {
                          + container_port = 80
                          + name           = "http"
                          + protocol       = "TCP"
                        }

                      + resources {
                          + limits   = (known after apply)
                          + requests = (known after apply)
                        }
                    }

                  + image_pull_secrets {
                      + name = (known after apply)
                    }

                  + readiness_gate {
                      + condition_type = (known after apply)
                    }

                  + volume {
                      + name = (known after apply)

                      + aws_elastic_block_store {
                          + fs_type   = (known after apply)
                          + partition = (known after apply)
                          + read_only = (known after apply)
                          + volume_id = (known after apply)
                        }

                      + azure_disk {
                          + caching_mode  = (known after apply)
                          + data_disk_uri = (known after apply)
                          + disk_name     = (known after apply)
                          + fs_type       = (known after apply)
                          + kind          = (known after apply)
                          + read_only     = (known after apply)
                        }

                      + azure_file {
                          + read_only        = (known after apply)
                          + secret_name      = (known after apply)
                          + secret_namespace = (known after apply)
                          + share_name       = (known after apply)
                        }

                      + ceph_fs {
                          + monitors    = (known after apply)
                          + path        = (known after apply)
                          + read_only   = (known after apply)
                          + secret_file = (known after apply)
                          + user        = (known after apply)

                          + secret_ref {
                              + name      = (known after apply)
                              + namespace = (known after apply)
                            }
                        }

                      + cinder {
                          + fs_type   = (known after apply)
                          + read_only = (known after apply)
                          + volume_id = (known after apply)
                        }

                      + config_map {
                          + default_mode = (known after apply)
                          + name         = (known after apply)
                          + optional     = (known after apply)

                          + items {
                              + key  = (known after apply)
                              + mode = (known after apply)
                              + path = (known after apply)
                            }
                        }

                      + csi {
                          + driver            = (known after apply)
                          + fs_type           = (known after apply)
                          + read_only         = (known after apply)
                          + volume_attributes = (known after apply)

                          + node_publish_secret_ref {
                              + name = (known after apply)
                            }
                        }

                      + downward_api {
                          + default_mode = (known after apply)

                          + items {
                              + mode = (known after apply)
                              + path = (known after apply)

                              + field_ref {
                                  + api_version = (known after apply)
                                  + field_path  = (known after apply)
                                }

                              + resource_field_ref {
                                  + container_name = (known after apply)
                                  + divisor        = (known after apply)
                                  + resource       = (known after apply)
                                }
                            }
                        }

                      + empty_dir {
                          + medium     = (known after apply)
                          + size_limit = (known after apply)
                        }

                      + fc {
                          + fs_type      = (known after apply)
                          + lun          = (known after apply)
                          + read_only    = (known after apply)
                          + target_ww_ns = (known after apply)
                        }

                      + flex_volume {
                          + driver    = (known after apply)
                          + fs_type   = (known after apply)
                          + options   = (known after apply)
                          + read_only = (known after apply)

                          + secret_ref {
                              + name      = (known after apply)
                              + namespace = (known after apply)
                            }
                        }

                      + flocker {
                          + dataset_name = (known after apply)
                          + dataset_uuid = (known after apply)
                        }

                      + gce_persistent_disk {
                          + fs_type   = (known after apply)
                          + partition = (known after apply)
                          + pd_name   = (known after apply)
                          + read_only = (known after apply)
                        }

                      + git_repo {
                          + directory  = (known after apply)
                          + repository = (known after apply)
                          + revision   = (known after apply)
                        }

                      + glusterfs {
                          + endpoints_name = (known after apply)
                          + path           = (known after apply)
                          + read_only      = (known after apply)
                        }

                      + host_path {
                          + path = (known after apply)
                          + type = (known after apply)
                        }

                      + iscsi {
                          + fs_type         = (known after apply)
                          + iqn             = (known after apply)
                          + iscsi_interface = (known after apply)
                          + lun             = (known after apply)
                          + read_only       = (known after apply)
                          + target_portal   = (known after apply)
                        }

                      + local {
                          + path = (known after apply)
                        }

                      + nfs {
                          + path      = (known after apply)
                          + read_only = (known after apply)
                          + server    = (known after apply)
                        }

                      + persistent_volume_claim {
                          + claim_name = (known after apply)
                          + read_only  = (known after apply)
                        }

                      + photon_persistent_disk {
                          + fs_type = (known after apply)
                          + pd_id   = (known after apply)
                        }

                      + projected {
                          + default_mode = (known after apply)

                          + sources {
                              + config_map {
                                  + name     = (known after apply)
                                  + optional = (known after apply)

                                  + items {
                                      + key  = (known after apply)
                                      + mode = (known after apply)
                                      + path = (known after apply)
                                    }
                                }

                              + downward_api {
                                  + items {
                                      + mode = (known after apply)
                                      + path = (known after apply)

                                      + field_ref {
                                          + api_version = (known after apply)
                                          + field_path  = (known after apply)
                                        }

                                      + resource_field_ref {
                                          + container_name = (known after apply)
                                          + divisor        = (known after apply)
                                          + resource       = (known after apply)
                                        }
                                    }
                                }

                              + secret {
                                  + name     = (known after apply)
                                  + optional = (known after apply)

                                  + items {
                                      + key  = (known after apply)
                                      + mode = (known after apply)
                                      + path = (known after apply)
                                    }
                                }

                              + service_account_token {
                                  + audience           = (known after apply)
                                  + expiration_seconds = (known after apply)
                                  + path               = (known after apply)
                                }
                            }
                        }

                      + quobyte {
                          + group     = (known after apply)
                          + read_only = (known after apply)
                          + registry  = (known after apply)
                          + user      = (known after apply)
                          + volume    = (known after apply)
                        }

                      + rbd {
                          + ceph_monitors = (known after apply)
                          + fs_type       = (known after apply)
                          + keyring       = (known after apply)
                          + rados_user    = (known after apply)
                          + rbd_image     = (known after apply)
                          + rbd_pool      = (known after apply)
                          + read_only     = (known after apply)

                          + secret_ref {
                              + name      = (known after apply)
                              + namespace = (known after apply)
                            }
                        }

                      + secret {
                          + default_mode = (known after apply)
                          + optional     = (known after apply)
                          + secret_name  = (known after apply)

                          + items {
                              + key  = (known after apply)
                              + mode = (known after apply)
                              + path = (known after apply)
                            }
                        }

                      + vsphere_volume {
                          + fs_type     = (known after apply)
                          + volume_path = (known after apply)
                        }
                    }
                }
            }
        }
    }

  # module.k8s.kubernetes_horizontal_pod_autoscaler_v1.nginx_ingress_hpa will be created
  + resource "kubernetes_horizontal_pod_autoscaler_v1" "nginx_ingress_hpa" {
      + id = (known after apply)

      + metadata {
          + generation       = (known after apply)
          + name             = "nginx-ingress-hpa"
          + namespace        = "default"
          + resource_version = (known after apply)
          + uid              = (known after apply)
        }

      + spec {
          + max_replicas                      = 10
          + min_replicas                      = 8
          + target_cpu_utilization_percentage = (known after apply)

          + scale_target_ref {
              + kind = "Deployment"
              + name = "nginx-frontend-deployment"
            }
        }
    }

  # module.k8s.kubernetes_ingress_v1.nginx_ingress will be created
  + resource "kubernetes_ingress_v1" "nginx_ingress" {
      + id                     = (known after apply)
      + status                 = (known after apply)
      + wait_for_load_balancer = true

      + metadata {
          + generation       = (known after apply)
          + name             = "nginx"
          + namespace        = "default"
          + resource_version = (known after apply)
          + uid              = (known after apply)
        }

      + spec {
          + ingress_class_name = "nginx"

          + rule {
              + http {
                  + path {
                      + path      = "/*"
                      + path_type = "ImplementationSpecific"

                      + backend {

                          + service {
                              + name = "ingress-service"

                              + port {
                                  + number = 80
                                }
                            }
                        }
                    }
                }
            }
        }
    }

  # module.k8s.kubernetes_service_v1.backend_elb will be created
  + resource "kubernetes_service_v1" "backend_elb" {
      + id                     = (known after apply)
      + status                 = (known after apply)
      + wait_for_load_balancer = true

      + metadata {
          + generation       = (known after apply)
          + name             = "backend-elb"
          + namespace        = "default"
          + resource_version = (known after apply)
          + uid              = (known after apply)
        }

      + spec {
          + allocate_load_balancer_node_ports = true
          + cluster_ip                        = (known after apply)
          + cluster_ips                       = (known after apply)
          + external_traffic_policy           = (known after apply)
          + health_check_node_port            = (known after apply)
          + internal_traffic_policy           = (known after apply)
          + ip_families                       = (known after apply)
          + ip_family_policy                  = (known after apply)
          + publish_not_ready_addresses       = false
          + selector                          = {
              + "apache_backend_deployment" = "apache"
            }
          + session_affinity                  = "None"
          + type                              = "LoadBalancer"

          + port {
              + node_port   = (known after apply)
              + port        = 8080
              + protocol    = "TCP"
              + target_port = "80"
            }

          + session_affinity_config {
              + client_ip {
                  + timeout_seconds = (known after apply)
                }
            }
        }
    }

  # module.k8s.kubernetes_service_v1.nginx_ingress_service will be created
  + resource "kubernetes_service_v1" "nginx_ingress_service" {
      + id                     = (known after apply)
      + status                 = (known after apply)
      + wait_for_load_balancer = true

      + metadata {
          + generation       = (known after apply)
          + name             = "ingress-service"
          + namespace        = "default"
          + resource_version = (known after apply)
          + uid              = (known after apply)
        }

      + spec {
          + allocate_load_balancer_node_ports = true
          + cluster_ip                        = (known after apply)
          + cluster_ips                       = (known after apply)
          + external_traffic_policy           = (known after apply)
          + health_check_node_port            = (known after apply)
          + internal_traffic_policy           = (known after apply)
          + ip_families                       = (known after apply)
          + ip_family_policy                  = (known after apply)
          + publish_not_ready_addresses       = false
          + selector                          = {
              + "nginx_frontend_deployment" = "nginx"
            }
          + session_affinity                  = "None"
          + type                              = "NodePort"

          + port {
              + node_port   = (known after apply)
              + port        = 80
              + protocol    = "TCP"
              + target_port = "80"
            }

          + session_affinity_config {
              + client_ip {
                  + timeout_seconds = (known after apply)
                }
            }
        }
    }

  # module.rds.aws_db_instance.mysql_rds_instance will be created
  + resource "aws_db_instance" "mysql_rds_instance" {
      + address                               = (known after apply)
      + allocated_storage                     = 10
      + apply_immediately                     = false
      + arn                                   = (known after apply)
      + auto_minor_version_upgrade            = true
      + availability_zone                     = (known after apply)
      + backup_retention_period               = (known after apply)
      + backup_window                         = (known after apply)
      + ca_cert_identifier                    = (known after apply)
      + character_set_name                    = (known after apply)
      + copy_tags_to_snapshot                 = false
      + db_name                               = (known after apply)
      + db_subnet_group_name                  = "aws_db_subnet_group"
      + delete_automated_backups              = true
      + endpoint                              = (known after apply)
      + engine                                = "mysql"
      + engine_version                        = (known after apply)
      + engine_version_actual                 = (known after apply)
      + hosted_zone_id                        = (known after apply)
      + id                                    = (known after apply)
      + identifier                            = "testdb"
      + identifier_prefix                     = (known after apply)
      + instance_class                        = "db.t3.micro"
      + iops                                  = (known after apply)
      + kms_key_id                            = (known after apply)
      + latest_restorable_time                = (known after apply)
      + license_model                         = (known after apply)
      + maintenance_window                    = (known after apply)
      + monitoring_interval                   = 0
      + monitoring_role_arn                   = (known after apply)
      + multi_az                              = (known after apply)
      + name                                  = (known after apply)
      + nchar_character_set_name              = (known after apply)
      + network_type                          = (known after apply)
      + option_group_name                     = (known after apply)
      + parameter_group_name                  = (known after apply)
      + password                              = (sensitive value)
      + performance_insights_enabled          = false
      + performance_insights_kms_key_id       = (known after apply)
      + performance_insights_retention_period = (known after apply)
      + port                                  = (known after apply)
      + publicly_accessible                   = false
      + replica_mode                          = (known after apply)
      + replicas                              = (known after apply)
      + resource_id                           = (known after apply)
      + skip_final_snapshot                   = true
      + snapshot_identifier                   = (known after apply)
      + status                                = (known after apply)
      + storage_throughput                    = (known after apply)
      + storage_type                          = (known after apply)
      + tags                                  = {
          + "CreatedBy" = "Bhagyesh Soni"
          + "Name"      = "Terraform citadel module assignment"
        }
      + tags_all                              = {
          + "CreatedBy"                                  = "Bhagyesh Soni"
          + "Name"                                       = "Terraform citadel module assignment"
          + "Owner"                                      = "Bhagyesh Soni"
          + "kubernetes.io/cluster/terraform_assignment" = "owned"
        }
      + timezone                              = (known after apply)
      + username                              = (sensitive value)
      + vpc_security_group_ids                = (known after apply)
    }

  # module.rds.aws_db_subnet_group.db_subnet_group will be created
  + resource "aws_db_subnet_group" "db_subnet_group" {
      + arn                     = (known after apply)
      + description             = "Managed by Terraform"
      + id                      = (known after apply)
      + name                    = "aws_db_subnet_group"
      + name_prefix             = (known after apply)
      + subnet_ids              = (known after apply)
      + supported_network_types = (known after apply)
      + tags                    = {
          + "Name" = "My DB subnet group"
        }
      + tags_all                = {
          + "Name"                                       = "My DB subnet group"
          + "Owner"                                      = "Bhagyesh Soni"
          + "kubernetes.io/cluster/terraform_assignment" = "owned"
        }
    }

  # module.rds.aws_secretsmanager_secret.db_secret will be created
  + resource "aws_secretsmanager_secret" "db_secret" {
      + arn                            = (known after apply)
      + force_overwrite_replica_secret = false
      + id                             = (known after apply)
      + name                           = "db_password"
      + name_prefix                    = (known after apply)
      + policy                         = (known after apply)
      + recovery_window_in_days        = 0
      + rotation_enabled               = (known after apply)
      + rotation_lambda_arn            = (known after apply)
      + tags_all                       = {
          + "Owner"                                      = "Bhagyesh Soni"
          + "kubernetes.io/cluster/terraform_assignment" = "owned"
        }

      + replica {
          + kms_key_id         = (known after apply)
          + last_accessed_date = (known after apply)
          + region             = (known after apply)
          + status             = (known after apply)
          + status_message     = (known after apply)
        }

      + rotation_rules {
          + automatically_after_days = (known after apply)
        }
    }

  # module.rds.aws_secretsmanager_secret_version.db_pass will be created
  + resource "aws_secretsmanager_secret_version" "db_pass" {
      + arn            = (known after apply)
      + id             = (known after apply)
      + secret_id      = (known after apply)
      + secret_string  = (sensitive value)
      + version_id     = (known after apply)
      + version_stages = (known after apply)
    }

  # module.rds.random_password.db_password will be created
  + resource "random_password" "db_password" {
      + bcrypt_hash      = (sensitive value)
      + id               = (known after apply)
      + length           = 16
      + lower            = true
      + min_lower        = 1
      + min_numeric      = 1
      + min_special      = 2
      + min_upper        = 1
      + number           = true
      + numeric          = true
      + override_special = "_"
      + result           = (sensitive value)
      + special          = true
      + upper            = true
    }

  # module.vpc.aws_eip.my_eip[0] will be created
  + resource "aws_eip" "my_eip" {
      + allocation_id        = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = (known after apply)
      + id                   = (known after apply)
      + instance             = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + tags_all             = {
          + "Owner"                                      = "Bhagyesh Soni"
          + "kubernetes.io/cluster/terraform_assignment" = "owned"
        }
      + vpc                  = true
    }

  # module.vpc.aws_eip.my_eip[1] will be created
  + resource "aws_eip" "my_eip" {
      + allocation_id        = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = (known after apply)
      + id                   = (known after apply)
      + instance             = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + tags_all             = {
          + "Owner"                                      = "Bhagyesh Soni"
          + "kubernetes.io/cluster/terraform_assignment" = "owned"
        }
      + vpc                  = true
    }

  # module.vpc.aws_internet_gateway.my_igw will be created
  + resource "aws_internet_gateway" "my_igw" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name" = "my_custom_igw"
        }
      + tags_all = {
          + "Name"                                       = "my_custom_igw"
          + "Owner"                                      = "Bhagyesh Soni"
          + "kubernetes.io/cluster/terraform_assignment" = "owned"
        }
      + vpc_id   = (known after apply)
    }

  # module.vpc.aws_nat_gateway.nat_gw[0] will be created
  + resource "aws_nat_gateway" "nat_gw" {
      + allocation_id        = (known after apply)
      + connectivity_type    = "public"
      + id                   = (known after apply)
      + network_interface_id = (known after apply)
      + private_ip           = (known after apply)
      + public_ip            = (known after apply)
      + subnet_id            = (known after apply)
      + tags                 = {
          + "Name" = "Nat-gw"
        }
      + tags_all             = {
          + "Name"                                       = "Nat-gw"
          + "Owner"                                      = "Bhagyesh Soni"
          + "kubernetes.io/cluster/terraform_assignment" = "owned"
        }
    }

  # module.vpc.aws_nat_gateway.nat_gw[1] will be created
  + resource "aws_nat_gateway" "nat_gw" {
      + allocation_id        = (known after apply)
      + connectivity_type    = "public"
      + id                   = (known after apply)
      + network_interface_id = (known after apply)
      + private_ip           = (known after apply)
      + public_ip            = (known after apply)
      + subnet_id            = (known after apply)
      + tags                 = {
          + "Name" = "Nat-gw"
        }
      + tags_all             = {
          + "Name"                                       = "Nat-gw"
          + "Owner"                                      = "Bhagyesh Soni"
          + "kubernetes.io/cluster/terraform_assignment" = "owned"
        }
    }

  # module.vpc.aws_route_table.private_route_table[0] will be created
  + resource "aws_route_table" "private_route_table" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + carrier_gateway_id         = ""
              + cidr_block                 = "0.0.0.0/0"
              + core_network_arn           = ""
              + destination_prefix_list_id = ""
              + egress_only_gateway_id     = ""
              + gateway_id                 = ""
              + instance_id                = ""
              + ipv6_cidr_block            = ""
              + local_gateway_id           = ""
              + nat_gateway_id             = (known after apply)
              + network_interface_id       = ""
              + transit_gateway_id         = ""
              + vpc_endpoint_id            = ""
              + vpc_peering_connection_id  = ""
            },
        ]
      + tags             = {
          + "Name" = "private_route_table_0"
        }
      + tags_all         = {
          + "Name"                                       = "private_route_table_0"
          + "Owner"                                      = "Bhagyesh Soni"
          + "kubernetes.io/cluster/terraform_assignment" = "owned"
        }
      + vpc_id           = (known after apply)
    }

  # module.vpc.aws_route_table.private_route_table[1] will be created
  + resource "aws_route_table" "private_route_table" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + carrier_gateway_id         = ""
              + cidr_block                 = "0.0.0.0/0"
              + core_network_arn           = ""
              + destination_prefix_list_id = ""
              + egress_only_gateway_id     = ""
              + gateway_id                 = ""
              + instance_id                = ""
              + ipv6_cidr_block            = ""
              + local_gateway_id           = ""
              + nat_gateway_id             = (known after apply)
              + network_interface_id       = ""
              + transit_gateway_id         = ""
              + vpc_endpoint_id            = ""
              + vpc_peering_connection_id  = ""
            },
        ]
      + tags             = {
          + "Name" = "private_route_table_1"
        }
      + tags_all         = {
          + "Name"                                       = "private_route_table_1"
          + "Owner"                                      = "Bhagyesh Soni"
          + "kubernetes.io/cluster/terraform_assignment" = "owned"
        }
      + vpc_id           = (known after apply)
    }

  # module.vpc.aws_route_table.public_route_table will be created
  + resource "aws_route_table" "public_route_table" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + carrier_gateway_id         = ""
              + cidr_block                 = "0.0.0.0/0"
              + core_network_arn           = ""
              + destination_prefix_list_id = ""
              + egress_only_gateway_id     = ""
              + gateway_id                 = (known after apply)
              + instance_id                = ""
              + ipv6_cidr_block            = ""
              + local_gateway_id           = ""
              + nat_gateway_id             = ""
              + network_interface_id       = ""
              + transit_gateway_id         = ""
              + vpc_endpoint_id            = ""
              + vpc_peering_connection_id  = ""
            },
        ]
      + tags             = {
          + "Name" = "public_route_table"
        }
      + tags_all         = {
          + "Name"                                       = "public_route_table"
          + "Owner"                                      = "Bhagyesh Soni"
          + "kubernetes.io/cluster/terraform_assignment" = "owned"
        }
      + vpc_id           = (known after apply)
    }

  # module.vpc.aws_route_table_association.private_route_table_association[0] will be created
  + resource "aws_route_table_association" "private_route_table_association" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.private_route_table_association[1] will be created
  + resource "aws_route_table_association" "private_route_table_association" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.public_route_table_association[0] will be created
  + resource "aws_route_table_association" "public_route_table_association" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.public_route_table_association[1] will be created
  + resource "aws_route_table_association" "public_route_table_association" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_subnet.private_subnet[0] will be created
  + resource "aws_subnet" "private_subnet" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.10.4.0/23"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name"                            = "private-subnet-0"
          + "kubernetes.io/role/internal-elb" = "1"
        }
      + tags_all                                       = {
          + "Name"                                       = "private-subnet-0"
          + "Owner"                                      = "Bhagyesh Soni"
          + "kubernetes.io/cluster/terraform_assignment" = "owned"
          + "kubernetes.io/role/internal-elb"            = "1"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.private_subnet[1] will be created
  + resource "aws_subnet" "private_subnet" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.10.6.0/23"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name"                            = "private-subnet-1"
          + "kubernetes.io/role/internal-elb" = "1"
        }
      + tags_all                                       = {
          + "Name"                                       = "private-subnet-1"
          + "Owner"                                      = "Bhagyesh Soni"
          + "kubernetes.io/cluster/terraform_assignment" = "owned"
          + "kubernetes.io/role/internal-elb"            = "1"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.public_subnet[0] will be created
  + resource "aws_subnet" "public_subnet" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.10.0.0/23"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name"                   = "public-subnet-0"
          + "kubernetes.io/role/elb" = "1"
        }
      + tags_all                                       = {
          + "Name"                                       = "public-subnet-0"
          + "Owner"                                      = "Bhagyesh Soni"
          + "kubernetes.io/cluster/terraform_assignment" = "owned"
          + "kubernetes.io/role/elb"                     = "1"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.public_subnet[1] will be created
  + resource "aws_subnet" "public_subnet" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.10.2.0/23"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name"                   = "public-subnet-1"
          + "kubernetes.io/role/elb" = "1"
        }
      + tags_all                                       = {
          + "Name"                                       = "public-subnet-1"
          + "Owner"                                      = "Bhagyesh Soni"
          + "kubernetes.io/cluster/terraform_assignment" = "owned"
          + "kubernetes.io/role/elb"                     = "1"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_vpc.my_custom_vpc will be created
  + resource "aws_vpc" "my_custom_vpc" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.10.0.0/21"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_classiclink                   = (known after apply)
      + enable_classiclink_dns_support       = (known after apply)
      + enable_dns_hostnames                 = true
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "my_custom_vpc"
        }
      + tags_all                             = {
          + "Name"                                       = "my_custom_vpc"
          + "Owner"                                      = "Bhagyesh Soni"
          + "kubernetes.io/cluster/terraform_assignment" = "owned"
        }
    }

Plan: 40 to add, 0 to change, 0 to destroy.

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
```