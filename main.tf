resource "aws_organizations_organizational_unit" "top_ou" {
  for_each  = toset(local.top_org_units)
  name      = each.value
  parent_id = local.root_organitzation_id
}

# resource "aws_organizations_organizational_unit" "apps_infra" {
#   for_each  = toset(var.apps)
#   name      = each.value
#   parent_id = aws_organizations_organizational_unit.top_ou["apps"].id

#   depends_on = [
#     aws_organizations_organizational_unit.top_ou["apps"]
#   ]
# }


resource "aws_budgets_budget" "cost_daily" {
  name              = "aws-account-daily"
  budget_type       = "COST"
  limit_amount      = "1"
  limit_unit        = "USD"
  time_period_start = "2017-07-01_00:00"
  time_unit         = "DAILY"

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 10
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["carlos.angulo.mascarell@outlook.com"]
  }
}

resource "aws_budgets_budget" "cost_monthly" {
  name              = "aws-account-monthly"
  budget_type       = "COST"
  limit_amount      = "10"
  limit_unit        = "USD"
  time_period_start = "2017-07-01_00:00"
  time_unit         = "MONTHLY"

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 25
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["carlos.angulo.mascarell@outlook.com"]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 50
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["carlos.angulo.mascarell@outlook.com"]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 75
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["carlos.angulo.mascarell@outlook.com"]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["carlos.angulo.mascarell@outlook.com"]
  }
}
