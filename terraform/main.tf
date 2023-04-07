resource "azurerm_log_analytics_workspace" "this" {
  name                = format("%s-%s-%s", var.env, local.common_name, "la")
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_application_insights" "this" {
  name                = format("%s-%s-%s", var.env, local.common_name, "appi")
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  workspace_id        = azurerm_log_analytics_workspace.this.id
  application_type    = "web"
}