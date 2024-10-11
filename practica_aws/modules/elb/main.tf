resource "aws_elb" "my_elb" {
  name               = "kc-alb-laura"
  availability_zones = ["eu-west-1a", "eu-west-1b"]  # Usa las zonas de disponibilidad correspondientes

  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }

  health_check {
    target              = "HTTP:80/"
    interval            = 30
    timeout             = 5
    healthy_threshold  = 2
    unhealthy_threshold = 2
  }

  security_groups = ["sg-05cb0048d2ffc49f7"]  # Usa tu ID de grupo de seguridad

  tags = {
    Name = "kc-sc-laura"  # Usa el nombre que prefieras
  }
}

resource "aws_lb" "nginx_lb" {
  name               = "nginx-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-05cb0048d2ffc49f7"]  # Usa tu ID de grupo de seguridad
  subnets            = var.subnet_ids  # Usa directamente la lista de subredes pasadas como variable

  enable_deletion_protection = false

  tags = {
    Name = "nginx-load-balancer"
  }
}
