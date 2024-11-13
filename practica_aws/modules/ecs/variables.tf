variable "ecs_task_definition_role" {
  description = "ARN del rol de definición de tareas de ECS"
  type        = string
}

variable "subnet_ids" {
  description = "Lista de IDs de subredes para el servicio de ECS"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Lista de IDs de grupos de seguridad para el servicio de ECS"
  type        = list(string)
}

variable "desired_count" {
  description = "Número deseado de instancias de la tarea"
  type        = number
  default     = 1
}

variable "cpu" {
  description = "CPU para la tarea"
  type        = string
  default     = "256"
}

variable "memory" {
  description = "Memoria para la tarea"
  type        = string
  default     = "512"
}

variable "container_image" {
  description = "Imagen del contenedor"
  type        = string
  default     = "nginx:latest"
}

variable "target_group_arn" {
  description = "ARN del grupo de destino"
  type        = string
}

