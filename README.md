# Shared Infrastructure

Shared Infrastructure for different repos

See [AKS Provisioning](https://github.com/vplauzon/aks/tree/master/aks-kubenet) for main inspiration on AKS.

# Access rights

The identity deployment the template must be able to perform role assignment.

Typically, only owners can do that.

If using Azure Dev Ops, a Service Principal is created to deploy the solution.  That service principal must have that priviledge.

# Create SSH key

In order to create a SSH public key, we did the following command in Linux:  `ssh-keygen -o`.  This creates a public key locally.  We can then `cat` the file to get the content.

# Azure Key Vault

ARM Templates need an Azure Key Vault secrets.

See [script file to configure the vault](secrets.sh).

The keyvault must be enabled for deployments.  We can modify an existing vault for this:

```bash
az keyvault update --enabled-for-template-deployment true --name <VAULT NAME>
```
