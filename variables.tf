variable "aws_region" {
  type = string
}

variable "aws_profile" {
  type = string
}

variable "app_version" {
  type = string
}

variable "deployment_time" {
  type = string
}

variable "apps" {
  description = "App to be created as under the App OU"
  type        = list(string)
}

variable "app_envs" {
  description = "Default envs to create for each app"
  type        = list(string)
}

variable "env_accounts" {
  description = "AWS Accounts to link to the common_app_resources OU"
  type = list(object({
    app = string
    env = string
    accounts = list(object({
      name  = string
      email = string
    }))
  }))
}
