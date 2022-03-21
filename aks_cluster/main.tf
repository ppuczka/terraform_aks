# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id  
}

resource "azurerm_resource_group" "az_aks_rg" {
  name     = "az-aks-rg-${var.env_name}"
  location = "West Europe"
}

resource "azurerm_kubernetes_cluster" "az_aks_cluster" {
  name                = "${var.cluster_name}-${var.env_name}"
  location            = azurerm_resource_group.az_aks_rg.location
  resource_group_name = azurerm_resource_group.az_aks_rg.name
  dns_prefix          = "az-aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  addon_profile {
    http_application_routing {
      enabled = true
    }
  }

  tags = {
    Environment = "Development"
  }
}
