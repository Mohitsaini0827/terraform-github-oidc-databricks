terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "databricks" {
  host          = var.databricks_host
  client_id     = var.databricks_client_id
  client_secret = var.databricks_client_secret
  # azure_client_id     = var.azure_client_id
  # azure_tenant_id     = var.azure_tenant_id
  # azure_client_secret = var.azure_client_secret
  # auth_type      = "env-oidc"
  # client_id      = var.azure_client_id   # ClientID field (env-oidc method)
  # oidc_token_env = "TFC_WORKLOAD_IDENTITY_TOKEN"
  # No azure_client_id / azure_tenant_id → azure method incomplete
  # auth_type forces env-oidc exclusively
}

# # ─── Databricks Account-Level Provider (MSI) ────────────────────────────────
# provider "databricks" {
#   alias     = "workspace"
#   host      = var.databricks_host
#   auth_type = "env-oidc"
#   oidc_token_env = "TFC_WORKLOAD_IDENTITY_TOKEN"
#   # azure_workspace_resource_id = var.azure_workspace_resource_id
#   # account_id = var.databricks_account_id
#   # Azure MSI Authentication
#   # azure_client_id = var.azure_client_id
#   # azure_tenant_id = var.azure_tenant_id
# }

# provider "databricks" {
#   alias     = "account"
#   host      = "https://accounts.azuredatabricks.net"
#   account_id = var.databricks_account_id
#   auth_type = "env-oidc"
#   oidc_token_env = "TFC_WORKLOAD_IDENTITY_TOKEN"
#   }

# # ─── AzureRM Provider (MSI) ─────────────────────────────────────────────────
# provider "azurerm" {
#   features {}
#   subscription_id = var.azure_subscription_id
#   tenant_id       = var.azure_tenant_id
#   client_id       = var.azure_client_id
#   }
