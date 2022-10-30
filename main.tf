module "dedicated-host" {
  source            = "DanielRDias/dedicated-host/aws"
  version           = "1.0.0"
  auto_placement    = var.auto_placement
  availability_zone = data.aws_subnet.selected.availability_zone
  host_recovery     = var.host_recovery
  instance_type     = var.instance_type
  outpost_arn       = var.outpost_arn
  tags              = var.tags
}

resource "aws_instance" "mac" {
  ami           = data.aws_ami.mac.id
  instance_type = var.mac_type == "mac2" ? "mac2.metal" : "mac1.metal"
  host_id       = module.dedicated-host.dedicated_host_id
  subnet_id     = var.subnet_id
  tags          = var.tags
}
