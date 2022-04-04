#Read and write permissions on the Microsoft.ContainerService/managedClusters resource type.

#AKS Must use MSI, SPN is not supported for Azure ARC and therefore not working with flux.

az feature register --namespace Microsoft.ContainerService --name AKS-ExtensionManager
az provider register --namespace Microsoft.Kubernetes
az provider register --namespace Microsoft.ContainerService
az provider register --namespace Microsoft.KubernetesConfiguration

echo "Registration is async, normaly completes whitin 10, rund verify-registrations.sh to check state, state should be Registered..."
