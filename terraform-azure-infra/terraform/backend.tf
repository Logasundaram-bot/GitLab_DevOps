terraform {
  backend "azurerm" {
    resource_group_name  = "terraform"          # RG for storing state
    storage_account_name = "tfstate135"         # Storage Account
    container_name       = "tfstatecontainer135"
  } 
}
  
