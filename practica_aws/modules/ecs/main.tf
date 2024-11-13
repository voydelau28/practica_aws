# Definir el clúster ECS
resource "aws_ecs_cluster" "main" {
  name = "kc-ecs-laura"
}

# Definición de la tarea de ECS con Nginx
resource "aws_ecs_task_definition" "nginx_task" {
  family                   = "nginx-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = var.ecs.task_definition_role
  container_definitions    = jsonencode([{
    name  = "nginx"
    image = var.container_image
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
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.subnet_ids
    security_groups = var.security_group_ids
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "nginx"
    container_port   = 80
  }
}

