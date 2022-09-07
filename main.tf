resource "azurerm_resource_group" "rg" {
  name     = "rg08"
  location = "East Us"
}

resource "azurerm_storage_account" "storage_function" {
  name                     = "functionappstorage07"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "azureserviceplane" {
  name                = "functionservicepalne07"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Windows"
  sku_name            = "Y1"
}

resource "azurerm_windows_function_app" "fuctionapp" {
  name                = "functionapp0809"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  storage_account_name       = azurerm_storage_account.storage_function.name
  storage_account_access_key = azurerm_storage_account.storage_function.primary_access_key
  service_plan_id            = azurerm_service_plan.azureserviceplane.id

  site_config {}
}
