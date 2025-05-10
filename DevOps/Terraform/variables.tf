output "aws_instance_ip" {
  value       = aws_instance.name.id
  description = "The public IP address of the EC2 instance"

}
locals {
  instance_name = "my-instance"
  ami_id        = "ami-0c55b159cbfafe1f0" # Example AMI ID, replace with a valid one
  instance_type = "t2.micro"
  region        = "us-east-1"

}
variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
  sensitive   = true

}
data "aws_acm_certificate" "name" {
  arn         = "arn:aws:acm:us-east-1:123456789012:certificate/abcd1234-abcd-1234-abcd-123456789012"
  most_recent = true
  statuses    = ["ISSUED"]
  provider    = aws.us-east-1
  lifecycle {
    ignore_changes        = [tags]
    prevent_destroy       = true
    create_before_destroy = true
    replace_triggered_by  = [aws_instance.name]
  }
  tags = {
    Name = "my-certificate"
  }
}
