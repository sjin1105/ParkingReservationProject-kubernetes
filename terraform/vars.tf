variable "control_count" {
  type        = number
  default     = "1"
}

variable "service_count" {
  type        = number
  default     = "3"
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

variable "test_memory" {
  type        = number
  default     = "4096"
}
variable "control_memory" {
  type        = number
  default     = "4096"
}

variable "service_memory" {
  type        = number
  default     = "2048"
}

variable "clone" {
  type        = string
  default     = "ubuntu-tmp"
}
