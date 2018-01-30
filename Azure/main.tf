
# Prompt for resource group name
variable "azurerm_resource_group" {
  type = "string"
}


# Create a resource group
resource "azurerm_resource_group" "production" {
  name     = "production"
  location = "South Central US"
  tags {
    environment = "production"
  }
}

# Create a virtual network in the web_servers resource group
resource "azurerm_virtual_network" "network" {
  name                = "productionNetwork"
  address_space       = ["10.0.0.0/16"]
  location            = "South Central US"
  resource_group_name = "${azurerm_resource_group.production.name}"

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  }

  subnet {
    name           = "subnet3"
    address_prefix = "10.0.3.0/24"
  }
}