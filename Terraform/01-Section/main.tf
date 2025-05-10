provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myec2" {
  count = 2
  ami           = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.publicSubnet.id

}
