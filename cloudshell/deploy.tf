provider "azurerm" {
  version = "~>2.0"
  features {}
}

resource "azurerm_resource_group" "rg" {
    name = "<name>"
    location = "westus"
}

resource "azurerm_app_service_plan" "rg" {
    name                = "<name>"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    sku {
        tier = "Free"
        size = "F1"
    }
}

resource "azurerm_storage_account" "rg" {
  name                     = "<name>"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "rg" {
  name                  = "<name>"
  storage_account_name  = azurerm_storage_account.rg.name
  container_access_type = "private"
}