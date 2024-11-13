# Declara un data source para el Load Balancer existente
data "aws_lb" "kc_alb_laura" {
  name = "kc-lb-laura"  # Asegúrate de que este nombre coincida con tu Load Balancer
}

# Crear el Target Group
resource "aws_lb_target_group" "app_tg" {
  name     = "kc-tg-laura"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

# Configurar el Listener
resource "aws_lb_listener" "app_listener" {
  load_balancer_arn = data.aws_lb.kc_alb_laura.arn  # Usa el ARN del Load Balancer existente
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}

