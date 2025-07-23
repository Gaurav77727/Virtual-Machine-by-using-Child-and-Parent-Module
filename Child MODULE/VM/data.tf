data "azurerm_subnet" "Frontend" {
  name                 = "Frontend-subnet"
  resource_group_name  = "Simple-RG"
  virtual_network_name = "Simple-network"
}

data "azurerm_public_ip" "PUBLICIP" {
  name                = "TestPublicIp"
  resource_group_name = "Simple-RG"
}

data "azurerm_network_security_group" "NSG" {
  name                = "Simple-security-group"
  resource_group_name = "Simple-RG"
}