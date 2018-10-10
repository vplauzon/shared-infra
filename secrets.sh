vault=<vault name>

# Dev

az keyvault secret set --vault-name $vault --name dev-shared-infra-ssh-public-key --value <VALUE>
az keyvault secret set --vault-name $vault --name dev-shared-infra-dns-prefix --value <VALUE>
az keyvault secret set --vault-name $vault --name dev-shared-infra-app-id --value <VALUE>
az keyvault secret set --vault-name $vault --name dev-shared-infra-object-id --value <VALUE>
az keyvault secret set --vault-name $vault --name dev-shared-infra-password --value <VALUE>

# Prod

az keyvault secret set --vault-name $vault --name prod-shared-infra-ssh-public-key --value <VALUE>
az keyvault secret set --vault-name $vault --name prod-shared-infra-dns-prefix --value <VALUE>
az keyvault secret set --vault-name $vault --name prod-shared-infra-app-id --value <VALUE>
az keyvault secret set --vault-name $vault --name prod-shared-infra-object-id --value <VALUE>
az keyvault secret set --vault-name $vault --name prod-shared-infra-password --value <VALUE>
