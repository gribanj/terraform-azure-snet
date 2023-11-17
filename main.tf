resource "azurerm_subnet" "snet" {
  count                                         = var.create ? 1 : 0
  name                                          = var.name
  resource_group_name                           = var.resource_group_name
  virtual_network_name                          = var.virtual_network_name
  address_prefixes                              = var.address_prefixes
  private_endpoint_network_policies_enabled     = true
  private_link_service_network_policies_enabled = true

  # uncomnet this block to enable delegation

  delegation {
    name = "${var.name}-delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
