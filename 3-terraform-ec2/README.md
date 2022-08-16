## Crear AMI
```
terraform init
terraform fmt
terraform validate
terraform apply
terraform destroy

ssh -i "epadilla.pem" ec2-user@3.86.90.199

terraform get -update

terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars" -auto-approve
terraform destroy -var-file="dev.tfvars"

terraform plan -destroy -var-file="dev.tfvars"
```
