output "ec2_instance_info" {
  value = aws_instance.roboshop[*].private_ip

  #value = aws_instance.roboshop 
  # Output only required attributes (like private_ip or instance_id)
  # instead of the full aws_instance object to avoid deprecated
  # internal attribute warnings from the AWS provider 

}