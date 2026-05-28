resource "aws_instance" "roboshop" {
    ami           = "ami-0220d79f3f480ecf5"
    instance_type = "t3.micro"
    vpc_security_group_ids = [ aws_security_group.allow-all-terraform.id ]
    tags = {
        Name = "HelloWorld"
    }
}

resource "aws_security_group" "allow-all-terraform" {
    name = "allow_all_terraform"
    description = "Allow all traffic"
    ingress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"  #-1 protocol will allow all ports along with above fields
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    tags = {
        name = "allow-all-terraform"
    }
}