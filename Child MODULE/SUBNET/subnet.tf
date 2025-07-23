resource "azurerm_subnet" "Frontend" {
  name                 = "Frontend-subnet"
  resource_group_name  = "Simple-RG"
  virtual_network_name = "Simple-network"
  address_prefixes     = ["10.0.1.0/24"]
  
}

