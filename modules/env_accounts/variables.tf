variable "app" {
  description = "App name where the environment is"
  type        = string
}

variable "env" {
  description = "Environment where the accounts will be linked"
  type        = string
}

variable "env_id" {
  description = "Environment Id where the accounts will be listed"
  type        = string
}

variable "accounts" {
  description = "Accounts to be created"
  type = list(object({
    name  = string
    email = string
  }))
}
