variable "project" {
    default = "roboshop"
}

variable "environment"{
    default = "dev"
}

variable "component" {
    default = "cart"
}

/* variable "final-name"{
    default = "${var.project}-${var.environment}-${var.component}"
} */

variable "common_tags" {
    default = {
        project = "roboshop"
        terraform = "true"
    }
}