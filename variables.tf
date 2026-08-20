variable "region" {
  default = "ap-south-1"
}

variable "key_pair_name" {
  description = "Name of the AWS key pair"
  type        = string
  default     = "terra-ec2-instance-key"
}

variable "public_key_path" {
  description = "Path to the public key file"
  type        = string
  default     = "terra-ec2-instance-key.pub"
}

variable "default_vpc_name" {
  description = "Tag name for the default VPC"
  type        = string
  default     = "Default VPC"
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
  default     = "My SG"
}

variable "security_group_description" {
  description = "Description of the security group"
  type        = string
  default     = "Allow SSH and HTTP access"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "node_amis" {
  description = "Map of node names to their specific AMI IDs"
  type        = map(string)
  default     = {
    "ansible-master-node"   = "ami-01a00762f46d584a1"
    "ansible-worker-node-1" = "ami-0ac7b260cf76d8865"
    "ansible-worker-node-2" = "ami-01a00762f46d584a1"
    "ansible-worker-node-3" = "ami-0011550b539717e2a"
  }
}

variable "root_volume_size" {
  description = "Root volume size in GB"
  type        = number
  default     = 10
}

variable "root_volume_type" {
  description = "Root volume type"
  type        = string
  default     = "gp3"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "Automate instance created by terraform"
}
