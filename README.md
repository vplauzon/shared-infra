# Shared Infrastructure

Shared Infrastructure for different repos

See [AKS Provisioning](https://github.com/vplauzon/aks/tree/master/aks-kubenet) for main inspiration on AKS.

# VNET

The VNET IP address needs to be compatible with [RFC 1918](https://en.wikipedia.org/wiki/Private_network) following the [CIDR](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing) notation.

# Create SSH key

In order to create a SSH public key, we did the following command in Linux:  `ssh-keygen -o`.  This creates a public key locally.  We can then `cat` the file to get the content.