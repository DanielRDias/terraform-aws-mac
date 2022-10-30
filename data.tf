data "aws_ami" "mac" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ec2-macos-${var.macos_version}*"]
  }

  filter {
    name   = "architecture"
    values = [var.mac_type == "mac2" ? "arm64_mac" : "x86_64_mac"]
  }

  owners = ["amazon"]
}

data "aws_subnet" "selected" {
  id = var.subnet_id
}
