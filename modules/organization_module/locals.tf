locals {
  accounts = coalesce(var.accounts, [])
  envs     = coalesce(var.envs, [])

  env_vs_account = length(local.envs) == 0 ? [] : flatten([
    for env in var.envs : flatten([for acc in env.accounts : {
      env_name = env.name
      ac_name  = acc.name
      ac_email = acc.email
    }]) if env.accounts != null
  ])

  common_tags = {
    organization = var.name
  }
}
