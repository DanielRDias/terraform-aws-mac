module "host" {
  source            = "DanielRDias/dedicated-host/aws"
  version           = "~> 1.0"
  auto_placement    = var.auto_placement
  availability_zone = try(data.aws_subnet.selected.availability_zone, null)
  host_recovery     = var.host_recovery
  instance_type     = try(var.mac_type == "mac2" ? "mac2.metal" : "mac1.metal", null)
  outpost_arn       = var.outpost_arn
  tags              = var.dedicated_host_tags
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 4.0"

  name = var.name

  ami                                  = try(coalesce(var.ami, data.aws_ami.mac.id), null)
  associate_public_ip_address          = var.associate_public_ip_address
  capacity_reservation_specification   = var.capacity_reservation_specification
  availability_zone                    = try(data.aws_subnet.selected.availability_zone, null)
  disable_api_termination              = var.disable_api_termination
  ebs_block_device                     = var.ebs_block_device
  ebs_optimized                        = var.ebs_optimized
  enclave_options_enabled              = var.enclave_options_enabled
  ephemeral_block_device               = var.ephemeral_block_device
  get_password_data                    = var.get_password_data
  hibernation                          = var.hibernation
  host_id                              = try(module.host.dedicated_host_id, null)
  iam_instance_profile                 = var.iam_instance_profile
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  instance_type                        = try(var.mac_type == "mac2" ? "mac2.metal" : "mac1.metal", null)
  ipv6_address_count                   = var.ipv6_address_count
  ipv6_addresses                       = var.ipv6_addresses
  key_name                             = var.key_name
  launch_template                      = var.launch_template
  metadata_options                     = var.metadata_options
  monitoring                           = var.monitoring
  network_interface                    = var.network_interface
  placement_group                      = var.placement_group
  private_ip                           = var.private_ip
  root_block_device                    = var.root_block_device
  secondary_private_ips                = var.secondary_private_ips
  source_dest_check                    = var.source_dest_check
  subnet_id                            = var.subnet_id
  user_data                            = var.user_data
  user_data_base64                     = var.user_data_base64
  user_data_replace_on_change          = var.user_data_replace_on_change

  vpc_security_group_ids = var.vpc_security_group_ids
  timeouts               = var.timeouts
  disable_api_stop       = var.disable_api_stop

  volume_tags        = var.volume_tags
  enable_volume_tags = var.enable_volume_tags

  create_iam_instance_profile   = var.create_iam_instance_profile
  iam_role_name                 = var.iam_role_name
  iam_role_use_name_prefix      = var.iam_role_use_name_prefix
  iam_role_path                 = var.iam_role_path
  iam_role_description          = var.iam_role_description
  iam_role_permissions_boundary = var.iam_role_permissions_boundary
  iam_role_tags                 = var.iam_role_tags

  tags = var.tags
}
