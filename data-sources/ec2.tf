resource "aws_instance" "roboshop" {
  ami = data.aws_ami.VishnuShop.id
  #ami                    = var.ami_id #left and right side names no need to same
  instance_type          = var.environment == "dev" ? "t3.micro" : "t3.small"
  vpc_security_group_ids = [aws_security_group.allow-all-terraform.id]
  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_security_group" "allow-all-terraform" {
  name        = var.sg_name
  description = var.sg_description

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port        = ingress.value["from_port"]
      to_port          = ingress.value["to_port"]
      protocol         = "-1"
      cidr_blocks      = var.sg_cidr_blocks
      ipv6_cidr_blocks = ["::/0"]
    }
  }
  egress {
    from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = "-1" #-1 protocol will allow all ports along with above fields
    cidr_blocks      = var.sg_cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = var.sg_tags
}