# Shared Infrastructure

Shared Infrastructure for different repos

See [AKS Provisioning](https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough)

# VNET

The VNET IP address needs to be compatible with [RFC 1918](https://en.wikipedia.org/wiki/Private_network) following the [CIDR](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing) notation.

**TODO**:  Give service principal *Network Contributor* role in the AKS subnet.

# Create SSH key

In order to create a SSH public key, we did the following command in Linux:  `ssh-keygen -o`.  This creates a public key locally.  We can then `cat` the file to get the content.