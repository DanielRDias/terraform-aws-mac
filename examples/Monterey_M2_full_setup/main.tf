provider "aws" {
  region = "us-east-1"
}

module "mac" {
  source        = "../../"
  macos_version = "12"   # macOS Monterey
  mac_type      = "mac2" # arm64_mac
  subnet_id     = "subnet-xxx"

  key_name = "my-mac-ssh-key-name" # in case you don't have an ssh key yet go to the "AWS console > ec2 > Key pairs" and create one

  vpc_security_group_ids = [aws_security_group.ssh.id]

  enable_volume_tags = false
  root_block_device = [
    {
      encrypted   = true
      volume_type = "gp3"
      throughput  = 200
      volume_size = 50
      tags = {
        Name = "my-mac-root-block"
      }
    }
  ]

  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
    instance_metadata_tags      = "enabled"
  }

  tags = {
    Name        = "Terraform Mac"
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_security_group" "ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  # vpc_id = vpc-xxx # add your vpc in case you are not using the default VPC

  ingress {
    description = "SSH ingress access only to your IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["123.4.5.6/32"] # replace 123.4.5.6 with your IP 
  }

  # Uncomment this code if you want to allow all internet egress access
  # egress {
  #   description = "Egress access to everything on the internet"
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = "-1"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  tags = {
    Name = "allow_ssh"
  }
}
