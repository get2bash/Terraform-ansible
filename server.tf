# creating instance 1
resource "aws_instance" "Altschool1" {
  ami             = "ami-01b8d743224353ffe"
  instance_type   = "t2.micro"
  key_name        = "altschool"
  security_groups = [aws_security_group.Altschool-security-grp-rule.id]
  subnet_id       = aws_subnet.Altschool-public-subnet1.id
  availability_zone = "eu-west-2a"
  tags = {
    Name   = "Altschool-1"
    source = "terraform"
  }
}
# creating instance 2
 resource "aws_instance" "Altschool2" {
  ami             = "ami-01b8d743224353ffe"
  instance_type   = "t2.micro"
  key_name        = "altschool"
  security_groups = [aws_security_group.Altschool-security-grp-rule.id]
  subnet_id       = aws_subnet.Altschool-public-subnet2.id
  availability_zone = "eu-west-2b"
  tags = {
    Name   = "Altschool-2"
    source = "terraform"
  }
}
# creating instance 3
resource "aws_instance" "Altschool3" {
  ami             = "ami-01b8d743224353ffe"
  instance_type   = "t2.micro"
  key_name        = "altschool"
  security_groups = [aws_security_group.Altschool-security-grp-rule.id]
  subnet_id       = aws_subnet.Altschool-public-subnet1.id
  availability_zone = "eu-west-2a"
  tags = {
    Name   = "Altschool-3"
    source = "terraform"
  }
}

# Create a file to store the IP addresses of the instances
resource "local_file" "Ip_address" {
  filename = "host-inventory"
  content  = <<EOT
${aws_instance.Altschool1.public_ip}
${aws_instance.Altschool2.public_ip}
${aws_instance.Altschool3.public_ip}
  EOT
}