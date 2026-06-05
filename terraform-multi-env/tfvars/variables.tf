variable "project" {
    default = "roboshop"
}

variable "environment"{
}

variable "instance_type" {
}

variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
    description = "AMI ID for DevOps"
}

/* variable "final-name"{
    default = "${var.project}-${var.environment}-${var.component}"
} */

variable "common_tags" {
    default = {
        project = "roboshop"
        Terraform = "true"
    }
}

variable "sg_name" {
    default = "allow-all"
}

variable "sg_description" {
  default = "allowing all ports for all ip"
}

variable "instances" {
  default = ["mongodb","redis","frontend"]
}

variable "sg_from_port" {
  default = 0
}

variable "sg_to_port" {
  default = 0
}

variable "sg_cidr_blocks" {
    default = ["0.0.0.0/0"]
}