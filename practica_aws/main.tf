# Usar la VPC ya existente
data "aws_vpc" "existing" {
  id = "vpc-08bffd360b72f38d5"  # ID de la VPC existente de usuario
}

# Usar las subredes públicas existentes
data "aws_subnet" "public" {
  count = 2
  id    = count.index == 0 ? "subnet-08db431b0d0bb12e4" : "subnet-04f02617fa4fa708b"  # IDs de las subredes públicas
}

# Usar el Security Group ya existente
data "aws_security_group" "existing_sg" {
  id = "sg-05cb0048d2ffc49f7"  # ID del security group existente de usuario
}

# Módulo IAM
module "iam" {
  source = "./modules/iam"
}

# Módulo de S3
module "s3" {
  source      = "./modules/s3"
  tag_name    = "kc-s3-laura"  # Personalización de etiqueta
  bucket_name = "nombre-de-tu-bucket"  # Ajuste solicitado
}

# Definir el Load Balancer
resource "aws_lb" "nginx_lb" {
  name               = "nginx-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_security_group.existing_sg.id]
  subnets            = data.aws_subnet.public[*].id
  enable_deletion_protection = false
}

# Definir el Target Group
resource "aws_lb_target_group" "nginx_tg" {
  name       = "nginx-tg"
  port       = 80
  protocol   = "HTTP"
  vpc_id     = data.aws_vpc.existing.id
  target_type = "ip"
}

# Listener para el Load Balancer
resource "aws_lb_listener" "nginx_listener" {
  load_balancer_arn = aws_lb.nginx_lb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx_tg.arn
  }
}

# Crear el clúster de ECS
resource "aws_ecs_cluster" "main" {
  name = "kc-ecs-laura"
}

# Definición de la tarea de ECS con Nginx
resource "aws_ecs_task_definition" "nginx_task" {
  family                   = "nginx-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = module.iam.execution_role_arn
  container_definitions    = jsonencode([{
    name  = "nginx"
    image = "nginx:latest"
    portMappings = [{
      containerPort = 80
      hostPort      = 80
    }]
  }])
}

# Servicio ECS para la tarea de Nginx con Load Balancer
resource "aws_ecs_service" "nginx_service" {
  name            = "nginx-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.nginx_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = data.aws_subnet.public[*].id
    security_groups = [data.aws_security_group.existing_sg.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.nginx_tg.arn
    container_name   = "nginx"
    container_port   = 80
  }
}
