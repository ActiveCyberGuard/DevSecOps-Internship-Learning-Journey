variable "project_name" {
  type        = string
  default     = "devsecops-final-project"
  description = "Name of the DevSecOps project"
}

variable "environment" {
  type        = string
  default     = "local-lab"
  description = "Deployment environment"
}