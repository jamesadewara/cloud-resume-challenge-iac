variable "function_name" {
  type = string
}

variable "api_name" {
  type = string
}

variable "mongodb_uri" {
  type      = string
  sensitive = true
}