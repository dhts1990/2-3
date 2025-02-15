data "aws_ami" "latest" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["al2023-ami-2023*x86_64"]
    }
  }

output "ami_id" {
  value = data.aws_ami.latest.id
}

resource "aws_security_group" "ec2_security" {
  name   = var.sec_group_name
  vpc_id = aws_vpc.my_vpc.id # var.vpc_id
    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "public" {
  ami           = data.aws_ami.latest.id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.my_public_subnet_az1.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.ec2_security.id]

  tags = {
    Name = var.ec2_name
  }
}

output "ec2_public_ip" {
 value = aws_instance.public.public_ip
}