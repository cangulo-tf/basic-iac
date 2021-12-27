variable "app_name" {
  description = "App name for which the envs will be created"
  type        = string
}

variable "app_id" {
  description = "App OU Id. All the envs will be created under it."
  type        = string
}

variable "envs" {
  description = "Environments to be created as OU"
  type        = list(string)
}
