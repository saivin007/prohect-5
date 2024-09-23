provider "aws" {
  region = "us-west-1"  # Specify the AWS region
}

resource "aws_instance" "my_ec2_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # Replace with a valid AMI ID for us-west-1
  instance_type = "t2.micro"               # Choose your instance type

  # User data script to run on instance startup
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World!" > /var/tmp/hello.txt
              EOF
}

output "instance_id" {
  value = aws_instance.my_ec2_instance.id
}

output "public_ip" {
  value = aws_instance.my_ec2_instance.public_ip
}

