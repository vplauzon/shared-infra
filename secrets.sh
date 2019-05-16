vault=<vault name>

# Dev

az keyvault secret set --vault-name $vault --name dev-ip --value <VALUE>

az keyvault secret set --vault-name $vault --name dev-aks-ssh-public-key --value <VALUE>
az keyvault secret set --vault-name $vault --name dev-aks-dns-prefix --value <VALUE>
az keyvault secret set --vault-name $vault --name dev-aks-app-id --value <VALUE>
az keyvault secret set --vault-name $vault --name dev-aks-object-id --value <VALUE>
az keyvault secret set --vault-name $vault --name dev-aks-password --value <VALUE>

# Prod

az keyvault secret set --vault-name $vault --name prod-ip-blue --value <VALUE>
az keyvault secret set --vault-name $vault --name prod-ip-green --value <VALUE>

az keyvault secret set --vault-name $vault --name prod-aks-ssh-public-key --value <VALUE>
az keyvault secret set --vault-name $vault --name prod-aks-dns-prefix --value <VALUE>
az keyvault secret set --vault-name $vault --name prod-aks-app-id --value <VALUE>
az keyvault secret set --vault-name $vault --name prod-aks-object-id --value <VALUE>
az keyvault secret set --vault-name $vault --name prod-aks-password --value <VALUE>
