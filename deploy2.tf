provider "azurerm" {
  version = "~>2.0"
  features {}
}

resource "azurerm_resource_group" "main" {
    name = "terraform2"
    location = "westus"
}

resource "azurerm_app_service_plan" "main" {
    name                = "terraformviadevopsportal"
    location            = azurerm_resource_group.main.location
    resource_group_name = azurerm_resource_group.main.name
    sku {
        tier = "Free"
        size = "F1"
    }
}

resource "azurerm_storage_account" "rg" {
  name                     = "terraform2storageacct"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "main" {
  name                  = "terraform2storagecont"
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "private"
}
