# Definir la región
variable "aws_region" {
  description = "eu-west-1"
  type        = string
  default     = "eu-west-1"
}

variable "cluster_name" {
  description = "kc-ecs-laura"
  type        = string
  default     = "kc-ecs-laura"
}

variable "bucket_name" {
  description = "bucket-kc-laura"
  type        = string
  default     = "bucket-kc-laura"
}

variable "enable_versioning" {
  description = "Habilitar versionado en el bucket S3"
  type        = bool
  default     = false
}

variable "enable_website" {
  description = "Habilitar sitio web estático en el bucket S3"
  type        = bool
  default     = false
}

variable "tag_name" {
  description = "El nombre de la etiqueta para el bucket"
  type        = string
  default     = "kc-bn-laura"  # Puedes cambiar esto a lo que desees
}

