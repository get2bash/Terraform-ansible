resource "aws_instance" "instances" {
   count = 3   # Here we are creating 3 instances. 
   ami = "ami-0778521d914d23bc1"
   instance_type = "t2.micro"
   key_name = "altschool"
   tags = {
      Name = "mini-project-${count.index}"
   }
}
