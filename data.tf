data "azurerm_subnet" "existing_snet" {
  count                = var.create ? 0 : 1
  name                 = var.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
}
