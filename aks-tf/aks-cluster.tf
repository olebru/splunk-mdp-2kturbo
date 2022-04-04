resource "random_pet" "prefix" {}

provider "azurerm" {
  features {}
}

resource "azurecaf_naming_convention" "flux-lab-rg" {  
  name    = "${random_pet.prefix.id}-fluxlab"
  prefix  = "dev"
  resource_type    = "rg"
  postfix = "001"
  max_length = 32
  convention  = "cafrandom"
}

resource "azurecaf_naming_convention" "flux-aks-cluster" {  
  name    = random_pet.prefix.id
  prefix  = "dev"
  resource_type    = "aks"
  postfix = "001"
  max_length = 32
  convention  = "cafrandom"
}

resource "azurerm_resource_group" "flux-rg" {
  name     = azurecaf_naming_convention.flux-lab-rg.result
  location = "West Europe"
}


resource "azurerm_kubernetes_cluster" "default" {
    name                = azurecaf_naming_convention.flux-aks-cluster.result
    location            = azurerm_resource_group.flux-rg.location
    resource_group_name = azurerm_resource_group.flux-rg.name
    dns_prefix          = "${random_pet.prefix.id}-k8s"

    default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "standard_d2as_v5"
    os_disk_size_gb = 30
    }

    identity {
    type = "SystemAssigned"
    }

    role_based_access_control {
    enabled = true
    }

}

