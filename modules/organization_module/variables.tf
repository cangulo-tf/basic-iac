variable "name" {
  type = string
}

variable "parent_id" {
  type = string
}

variable "accounts" {
  type = list(object({
    name  = string
    email = string
  }))
}

variable "envs" {
  type = list(object({
    name = string
    accounts = optional(
      list(object({
        name  = string
        email = string
    })))
  }))
}
