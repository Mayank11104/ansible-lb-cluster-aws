output "ec2_instance_details" {
  description = "Map of Instance Names to their Instance ID and Public IP"
  value = {
    for name, instance in aws_instance.my-instance : name => {
      id        = instance.id
      public_ip = instance.public_ip
    }
  }
}
