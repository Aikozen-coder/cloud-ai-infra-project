terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "dockerhub_username" {
  type = string
}

variable "dockerhub_token" {
  type      = string
  sensitive = true
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-cloud-ai-project"
  location = "West US 2"
}

resource "azurerm_log_analytics_workspace" "law" {
  name                = "law-cloud-ai"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_container_group" "cg" {
  name                = "cg-cloud-ai"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  ip_address_type     = "Public"
  image_registry_credential {
    server   = "index.docker.io"
    username = var.dockerhub_username
    password = var.dockerhub_token
  }

  
  dns_name_label      = "cloud-ai-9e9a8e29"

  container {
    name   = "web"
    image  = "aikozen/cloud-ai-app:1.0"
    cpu    = 1
    memory = 1.5

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

  diagnostics {
    log_analytics {
      workspace_id  = azurerm_log_analytics_workspace.law.workspace_id
      workspace_key = azurerm_log_analytics_workspace.law.primary_shared_key
    }
  }
}

output "aci_fqdn" {
  value = azurerm_container_group.cg.fqdn
}
