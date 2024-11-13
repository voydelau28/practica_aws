variable "bucket_name" {
  description = "Nombre del bucket S3"
  type        = string
}

variable "tag_name" {
  description = "Etiqueta para el bucket S3"
  type        = string
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
