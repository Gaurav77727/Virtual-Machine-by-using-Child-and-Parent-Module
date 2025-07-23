resource "azurerm_network_interface" "NIC" {
  name                = "Simple-nic"
  location            = "West US"
  resource_group_name = "Simple-RG"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.Frontend.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.PUBLICIP.id

  }
}

resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  network_interface_id      = azurerm_network_interface.NIC.id
  network_security_group_id = data.azurerm_network_security_group.NSG.id
}


resource "azurerm_linux_virtual_machine" "VM" {
  name                            = "Simple-machine"
  resource_group_name             = "Simple-RG"
  location                        = "West US"
  size                            = "Standard_F2"
  admin_username                  = "adminuser"  # key vault ke data ko use krne ke liye key vault data source and two data source for key vault secrest
  admin_password                  = "Admin@1234567"
  disable_password_authentication = false # 👈 if we use user and password insted of ssh key
  network_interface_ids           = [azurerm_network_interface.NIC.id, ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
