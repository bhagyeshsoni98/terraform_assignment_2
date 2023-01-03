locals {
  total_instance_count = var.frontend_scaling_config_vars.desired_size + var.backend_scaling_config_vars.desired_size
}

resource "aws_ec2_capacity_reservation" "reserved_instances_policy" {
  instance_type     = var.reserved_instances_type
  instance_platform = var.reserved_instances_platform
  availability_zone = var.reserved_instances_az
  instance_count    = floor(local.total_instance_count / 2)
}
