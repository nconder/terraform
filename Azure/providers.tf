# Configure the Microsoft Azure Provider
provider "azurerm" {
	subscription_id	= "97606a53-8e61-432f-a983-bfb0426f866d"
	client_id 		= "9b651c5b-65b9-4eb5-80bc-bbb1056641ef"
	client_secret 	= "fV7ErLJ3uGKlXMtgbXlj4UY3kkTkQYg8mumUMy4KqeE="
	tenant_id		= "e4b3460f-9715-4d91-a9eb-fcb541798626"
}

# Variable resource group
variable "azurerm_resource_group" {
	type = "string"
	description = "AzureRM resource group name to create or use."
}

# Create a resource group
resource "azurerm_resource_group" "production" {
  name     = "production"
  location = "South Central US"
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