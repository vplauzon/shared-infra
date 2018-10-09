vault=vpl-shared-vault

# Dev

az keyvault secret set --vault-name $vault --name dev-shared-infra-ssh-public-key --value 
az keyvault secret set --vault-name $vault --name dev-shared-infra-dns-prefix --value 
az keyvault secret set --vault-name $vault --name dev-shared-infra-app-id --value 
az keyvault secret set --vault-name $vault --name dev-shared-infra-object-id --value 
az keyvault secret set --vault-name $vault --name dev-shared-infra-password --value 
