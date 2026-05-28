resource "aws_instance" "roboshop" {
    #for_each = var.instances
    for_each = toset(var.instances)
    ami           = var.ami_id #left and right side names no need to same
    #instance_type = each.value
    instance_type = "t3.micro"
    vpc_security_group_ids = [ aws_security_group.allow-all-terraform.id ]
    tags = {
        Name = each.key
    }
}

resource "aws_security_group" "allow-all-terraform" {
    name = var.sg_name
    description = var.sg_description
    ingress {
        from_port        = var.sg_from_port
        to_port          = var.sg_to_port
        protocol         = "-1"
        cidr_blocks      = var.sg_cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port        = var.sg_from_port
        to_port          = var.sg_to_port
        protocol         = "-1"  #-1 protocol will allow all ports along with above fields
        cidr_blocks      = var.sg_cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }
    tags = var.sg_tags
}