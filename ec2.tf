resource "aws_key_pair" "deployer_key" {
  key_name   = var.key_pair_name
  public_key = file(var.public_key_path)
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = var.default_vpc_name
  }
}

resource "aws_security_group" "My-SG" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH port open"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP port open"
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "All access open (Outbound)"
  }
}

resource "aws_instance" "my-instance" {

  for_each = var.node_amis
  key_name        = aws_key_pair.deployer_key.key_name
  security_groups = [aws_security_group.My-SG.name]
  instance_type   = var.instance_type
  ami             = each.value

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
  }

  tags = {
    Name = each.key
  }
}
