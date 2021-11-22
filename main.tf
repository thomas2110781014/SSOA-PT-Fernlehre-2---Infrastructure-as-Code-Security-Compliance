data "aws_ami" "amazon-linux-2" {
  most_recent = true

  owners = [ "amazon" ]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_security_group" "in_http" {
  name = "in_http"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"

  count = var.instance_count

  security_groups = ["no_inbound"]

  tags = {
    Name = "ec2-t2micro"
  }
}
