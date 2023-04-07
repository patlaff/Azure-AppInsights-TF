data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "this" {
  name     = var.rg_name
}