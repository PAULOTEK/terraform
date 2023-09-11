resource "azurerm_resource_group" "resource_group" {
  name     = "vm"
  location = var.location

  tags = local.common_tags
}

resource "azurerm_public_ip" "public_ip" {
  allocation_method   = "Dynamic"
  name                = "public_ip_terraform"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name
  tags                = local.common_tags
}

resource "azurerm_network_interface" "network_interface" {
  location            = var.location
  name                = "network_interface_terraform"
  resource_group_name = azurerm_resource_group.resource_group.name
  ip_configuration {
    name                          = "public_ip_terraform"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = data.terraform_remote_state.vnet.outputs.subnet_id
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
  tags = local.common_tags
}

resource "azurerm_network_interface_security_group_association" "nisga" {
  network_interface_id      = azurerm_network_interface.network_interface.id
  network_security_group_id = data.terraform_remote_state.vnet.outputs.security_group_id
}

resource "azurerm_linux_virtual_machine" "vm" {
  admin_username        = "terraform"
  name                  = "vm terraform"
  network_interface_ids = azurerm_network_interface.network_interface.id
  location              = var.location
  resource_group_name   = azurerm_resource_group.resource_group.name
  size                  = "Standard_B1s"
  admin_ssh_key {
    public_key = ""
    username   = file("~/.ssh/id_rsa.pub")
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    offer     = "UbuntuServer"
    publisher = "Canonical"
    sku       = "22.04-LTS"
    version   = "latest"
  }
  tags = local.common_tags
}