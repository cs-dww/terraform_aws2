provider "aws" {
  access_key = "ASIASYYEA7DMMM7QQ5EW"
  secret_key = "NKQWZOVOtsQK5Vsw8ZZ5X/TZ6o8Gxuup0B9QgUKw"
  token      = "FwoGZXIvYXdzEEcaDAHSiyrco93vJvLZKiK6Aebn2Rm8rQ/gQTIKFaaaep938ga+VXd8XXUSD+QsXXw2VPd6hT5IQFeo1lGZIZ0ibwOB3qUJ+PBpw056ne98cmTWwOAsr6uWmPxmAah15WLX43NtZ+FlggKRvQGa98+py2PtU+JlVA1RKLaR4ND1Nw2UAjShycQmIU5Uaf75RFQO3p/LGJLYHIebHGTfeGvdq55Imw1pxBMdk88x1E/p2Lj/hoycxNYx1RHiGMJ+dJDHsbnyeCQFugq/MSip9eOMBjItSuGKO6aVrU73xjng09ENxLQ0FpSFXF4JOamR1J+lwyWaCGSIHgAWwlnHMNf0"
  region     = "us-east-1"
}

resource "aws_security_group" "webserver_sg" {

  name = "Ports 22"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "dww" {
  ami                    = "ami-083654bd07b5da81d"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.webserver_sg.id}"]
  key_name               = "mykey"
  tags = {
    Name = "Ubuntu-Installation"
  }
}
output "my-public-ip" {
  value = aws_instance.dww.public_ip
}
