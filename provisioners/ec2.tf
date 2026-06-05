resource "aws_instance" "roboshop" {
    ami           = var.ami_id #left and right side names no need to same
    instance_type = var.instance_type
    vpc_security_group_ids = [ aws_security_group.allow-all-terraform.id ]
    tags = merge(
        var.ec2_tags,
        {
            Password = var.co_password
        }
    )
   /*  provisioner "local-exec" {
      command = "echo ${self.private_ip} > inventory"
      on_failure = continue #ignoring errors
    }

    provisioner "local-exec" {
        command = "echo 'instance is destroyed'"
        when = destroy
    } */
    connection {
        type = "ssh"
        user = "ec2-user"
        password = self.tags.Password
        host = self.public_ip
    }
    provisioner "remote-exec" {
        inline = [ 
            "sudo dnf install nginx -y",
            "sudo systemctl start nginx"
        ]
    }

    provisioner "remote-exec" {
        when = destroy
        inline = [ 
            "sudo systemctl stop nginx"
         ]
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