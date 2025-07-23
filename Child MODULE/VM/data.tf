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

data "azurerm_key_vault" "keyvault" {
  name                = "mykeyvault"
  resource_group_name = "Simpletijori"
}

data "azurerm_key_vault_secret" "kv-username" {
  name         = "user"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

data "azurerm_key_vault_secret" "kv-password" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}