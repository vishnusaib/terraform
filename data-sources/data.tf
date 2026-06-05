data "aws_ami" "VishnuShop" {
  owners      = ["973714476881"]
  most_recent = true

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

output "ami_id" {
  description = "ID of project AMI"
  value       = data.aws_ami.VishnuShop
}
