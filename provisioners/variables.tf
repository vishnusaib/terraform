variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
    description = "AMI ID for DevOps"
}

variable "instance_type" {
    default = "t3.micro"
}

variable "ec2_tags" {
    type = map(string)
    default = {
        Name = "HelloWorld"
        Purpose = "variables-demo"
    }
}

variable "sg_name" {
    default = "allow-all-terraform"
}

variable "sg_description" {
    default = "allow all traffic"
}

variable "sg_from_port" {
    type = number
    default = 0
}

variable "sg_to_port" {
    type = number
    default = 0
}

variable "sg_cidr_blocks" {
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "sg_tags" {
    default = {
        Name = "Allow-All-Terraform"
    }
}

variable "co_password"{
    type = string
    sensitive = true
    description = "SSH password for the AMI"
}