variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5"
  description = "AMI ID for DevOps"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "ec2_tags" {
  type = map(string)
  default = {
    Name    = "RoboShop"
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
  type    = number
  default = 0
}

variable "sg_to_port" {
  type    = number
  default = 0
}

variable "sg_cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
  default = {
    Name = "Allow-All-Terraform"
  }
}

variable "environment" {
  default = "dev"
}

variable "instances" {
  default = ["mongodb", "mysql", "redis", "catalogue"]
}

variable "zone_id" {
  default = "Z06694613IPRQJX0M1H4B"
}

variable "domain_name" {
  default = "vishnuv8.shop"
}

variable "ingress_ports" {
  default = [ #list (map)
    {
    from_port = 22
    to_port   = 22
    },
    {
      from_port = 80
      to_port   = 80
    },
    {
      from_port = 8080
      to_port   = 8080
    }
  ]
}