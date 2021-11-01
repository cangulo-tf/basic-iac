tf plan -var-file=base.tfvars
tf apply -var-file=base.tfvars 

1. Comment the backend.tf file so you can have a tf state locally
2. Execute `tf init`
3. Execute `tf plan -var-file=base.tfvars`
4. Execute `tf apply -var-file=base.tfvars -auto-approve`
5. uncomment the backend.tf
6. Make sure all the parameters match the one defined in the base.tfvars
7. execute again tf init and answer yes to copy the state



# How to import a resource



tf state remove 'module.organization_apps["temp-app-envs"].aws_organizations_account.env_accounts["1-dev-cangulo_aws_dev"]'

tf import -var-file=base.tfvars 'module.organization_apps["temp-app-envs"].aws_organizations_account.env_accounts["1-dev-cangulo_aws_dev"]' 766939212012

tf import -var-file=base.tfvars 'module.organization_apps["temp-app-envs"].aws_organizations_account.env_accounts["1-dev-cangulo_aws_dev"]'     [ID]