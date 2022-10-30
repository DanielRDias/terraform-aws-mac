output "dedicated_hosts_arn" {
  description = "The ARN of the Dedicated Host."
  value       = module.dedicated-host.dedicated_host_arn
}

output "dedicated_host_id" {
  description = "Dedicated Host ID"
  value       = module.dedicated-host.dedicated_host_id
}

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

