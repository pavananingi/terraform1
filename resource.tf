resource "azurerm_resource_group" "pavanrg" {
  name     = var.rgname
  location = var.rglocation
}

resource "azurerm_virtual_network" "pavanvnet" {
  name                = var.vnetname
  address_space       = var.cidervnet
  location            = azurerm_resource_group.pavanrg.location
  resource_group_name = azurerm_resource_group.pavanrg.name
}

resource "azurerm_subnet" "pavansnet" {
  name                 = var.snetname
  resource_group_name  = azurerm_resource_group.pavanrg.name
  virtual_network_name = azurerm_virtual_network.pavanvnet.name
  address_prefixes     = var.cidersnet
}
