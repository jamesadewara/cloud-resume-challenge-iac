variable "function_name" {
  type = string
}

variable "api_name" {
  type = string
}

variable "mongodb_url" {
  type      = string
  sensitive = true
}

variable "mongodb_db_name" {
  type = string
}

variable "allowed_origins" {
  type = string
}