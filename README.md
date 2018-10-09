# Shared Infrastructure

Shared Infrastructure for different repos

See [AKS Provisioning](https://github.com/vplauzon/aks/tree/master/aks-kubenet) for main inspiration on AKS.

# VNET

The VNET IP address needs to be compatible with [RFC 1918](https://en.wikipedia.org/wiki/Private_network) following the [CIDR](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing) notation.

# Create SSH key

In order to create a SSH public key, we did the following command in Linux:  `ssh-keygen -o`.  This creates a public key locally.  We can then `cat` the file to get the content.

# Azure Key Vault

ARM Templates need an Azure Key Vault secrets.

See [script file to configure the vault](secrets.sh).

The keyvault must be enabled for deployments.  We can modify an existing vault for this:

```bash
az keyvault update --enabled-for-template-deployment true --name <VAULT NAME>
```