output "mac_ami_id" {
  value = data.aws_ami.mac.id
}

output "mac_ami_name" {
  value = data.aws_ami.mac.name
}

output "mac_ami_description" {
  value = data.aws_ami.mac.description
}

output "mac_ami_architecture" {
  value = data.aws_ami.mac.architecture
}

output "availability_zone" {
  value = data.aws_subnet.selected.availability_zone
}

output "host_id" {
  value = module.host.dedicated_host_id
}

output "host_arn" {
  value = module.host.dedicated_hosts_arn
}

output "ec2_id" {
  value = module.ec2_instance.id
}

output "ec2_arn" {
  value = module.ec2_instance.arn
}

output "ec2_instance_state" {
  value = module.ec2_instance.instance_state
}

output "ec2_primary_network_interface_id" {
  value = module.ec2_instance.primary_network_interface_id
}

output "ec2_private_dns" {
  value = module.ec2_instance.private_dns
}

output "ec2_public_dns" {
  value = module.ec2_instance.public_dns
}

output "ec2_public_ip" {
  value = module.ec2_instance.public_ip
}

output "ec2_private_ip" {
  value = module.ec2_instance.private_ip
}

output "ec2_ipv6_addresses" {
  value = module.ec2_instance.ipv6_addresses
}

output "ec2_tags_all" {
  value = module.ec2_instance.tags_all
}

################################################################################
# IAM Role / Instance Profile
################################################################################

output "ec2_iam_role_name" {
  value = module.ec2_instance.iam_role_name
}

output "ec2_iam_role_arn" {
  value = module.ec2_instance.iam_role_arn
}

output "ec2_iam_role_unique_id" {
  value = module.ec2_instance.iam_role_unique_id
}

output "ec2_iam_instance_profile_arn" {
  value = module.ec2_instance.iam_instance_profile_arn
}

output "ec2_iam_instance_profile_id" {
  value = module.ec2_instance.iam_instance_profile_id
}

output "ec2_iam_instance_profile_unique" {
  value = module.ec2_instance.iam_instance_profile_unique
}
