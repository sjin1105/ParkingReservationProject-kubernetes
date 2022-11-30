variable "control_count" {
  type        = number
  default     = "2"
}

variable "service_count" {
  type        = number
  default     = "4"
}

variable "os_type" {
  type        = string
  default     = "cloud-init"
}

variable "control_core" {
  type        = number
  default     = "2"
}

variable "service_core" {
  type        = number
  default     = "1"
}

variable "socket" {
  type        = number
  default     = "1"
}

variable "control_memory" {
  type        = number
  default     = "2048"
}

variable "service_memory" {
  type        = number
  default     = "2048"
}

variable "clone" {
  type        = string
  default     = "ubuntu-tmp"
}
