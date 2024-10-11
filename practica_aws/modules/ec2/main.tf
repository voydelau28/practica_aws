resource "aws_instance" "nginx" {
  ami                    = "ami-07355fe79b493752d" # Amazon Linux 2 AMI
  instance_type         = "t2.micro"
  subnet_id     = element(var.subnet_ids, 0) # Aquí puedes elegir qué subred usar
  associate_public_ip_address = true
  key_name              = "kc- kp- laura"

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install nginx1 -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF

  tags = {
    Name = "nginx-instance"
  }
}

