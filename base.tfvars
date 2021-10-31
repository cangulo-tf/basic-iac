aws_region  = "eu-west-1"
aws_profile = "default"
app_version = "0.0.1"

top_org_units = ["apps", "identity", "suspended-accounts"]

apps = [
  {
    name = "common"
    accounts = [{
      name  = "cangulo_aws_common"
      email = "cangulo_aws_common@outlook.es"
    }]
  },
  {
    name = "suspended-account"
  },
  {
    name = "temp-app-envs",
    envs = [
      {
        name = "1-dev"
        accounts = [{
          name  = "cangulo_aws_dev"
          email = "cangulo_aws_dev@outlook.es"
        }]
      },
      { name = "2-tst" },
      { name = "3-acc" },
      { name = "4-prd" }
    ]
  },
  {
    name = "journalbot",
    envs = [
      { name = "0-common" },
      { name = "1-dev" },
      { name = "2-tst" },
      { name = "3-acc" },
      { name = "4-prd" }
    ]
  }
]
