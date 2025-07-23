resource "azurerm_public_ip" "PUBLICIP" {
  name                = "TestPublicIp"
  resource_group_name = "Simple-RG"
  location            = "West US"
  allocation_method   = "Static"
}