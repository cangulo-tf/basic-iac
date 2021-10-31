variable "aws_region" {
  type = string
}

variable "aws_profile" {
  type = string
}

variable "app_version" {
  type = string
}

variable "top_org_units" {
  type = list(string)
}
variable "apps" {
  type = list(object({
    name = string

    accounts = optional(
      list(object({
        name  = string
        email = string
    })))

    envs = optional(
      list(object({
        name = string
        accounts = optional(
          list(object({
            name  = string
            email = string
        })))
    })))
  }))
}
