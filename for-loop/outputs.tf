output "ec2_instance_info" {

  # Output only required attributes (like private_ip or instance_id)
  # instead of the full aws_instance object to avoid deprecated
  # internal attribute warnings from the AWS provider

  value = {
    for k, v in aws_instance.roboshop : k => v.private_ip
  }
}