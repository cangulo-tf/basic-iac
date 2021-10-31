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
tf import -var-file=base.tfvars 'aws_organizations_organizational_unit.top_ou["apps"]'     [ID]