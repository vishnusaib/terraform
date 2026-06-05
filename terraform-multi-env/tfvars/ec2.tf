resource "aws_instance" "roboshop" {
    count = length(var.instances)
    ami           = var.ami_id #left and right side names no need to same
    instance_type = var.instance_type
    vpc_security_group_ids = [ aws_security_group.allow-all-terraform.id ]
    tags = merge(
        var.common_tags,
    {
        Name = "${var.instances[count.index]}-${var.environment}"
        Component = var.instances[count.index]
        Environment = var.environment
    }
    )
}

resource "aws_security_group" "allow-all-terraform" {
    name = "${var.sg_name}-${var.environment}"
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
    tags = merge(
        var.common_tags,
        {
            Name = "${var.sg_name}-${var.environment}"
        }
    )
}