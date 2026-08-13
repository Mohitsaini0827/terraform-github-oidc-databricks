###############################################################################
# Input Variables
###############################################################################

# ─── Databricks Account ─────────────────────────────────────────────────────

variable "databricks_host" {
  description = "Databricks account console URL."
  type        = string
  validation {
    condition     = can(regex("^https://", var.databricks_host))
    error_message = "The Databricks host must start with 'https://'."
  }
}

variable "databricks_account_id" {
  description = "Databricks account ID (UUID)."
  type        = string

  validation {
    condition     = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.databricks_account_id))
    error_message = "The Databricks account ID must be a valid UUID."
  }
}

# ─── Azure Service Principal & Subscription ────────────────────────────────

variable "databricks_client_id" {
  description = "Application (client) ID of the Service Principal with Federated Credentials."
  type        = string

  validation {
    condition     = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.azure_client_id))
    error_message = "The Azure client ID must be a valid UUID."
  }
}

variable "azure_tenant_id" {
  description = "Directory (tenant) ID of the Azure AD tenant."
  type        = string

  validation {
    condition     = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.azure_tenant_id))
    error_message = "The Azure tenant ID must be a valid UUID."
  }
}

variable "azure_subscription_id" {
  description = "Azure Subscription ID for the azurerm provider."
  type        = string

  validation {
    condition     = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.azure_subscription_id))
    error_message = "The Azure subscription ID must be a valid UUID."
  }
}

variable "databricks_client_secret" {
  description = "Client secret for the Azure Service Principal (if not using MSI)."
  type        = string
  sensitive   = true
  # default     = "dose38f0e738ccb22ba9935cbdfe847a615d"
}
# ─── Databricks Resources to Read ───────────────────────────────────────────

variable "group_names" {
  description = "List of Databricks account group display names to read."
  type        = list(string)

  validation {
    condition     = length(var.group_names) > 0
    error_message = "At least one group name must be provided."
  }
}

variable "user_name" {
  description = "Databricks account user login (email) to read."
  type        = string

  validation {
    condition     = can(regex("^[^@]+@[^@]+\\.[^@]+$", var.user_name))
    error_message = "The user_name must be a valid email address."
  }
}

# ─── Databricks Cluster Configuration ───────────────────────────────────────
variable "cluster_name" {
  description = "Name for the Databricks workspace cluster."
  type        = string
  default     = "dabx-cluster-tf"
}

variable "spark_version" {
  description = "Databricks Runtime version for the cluster."
  type        = string
  default     = "11.3.x-scala2.12"
}

variable "node_type_id" {
  description = "Node type for driver and workers (Databricks node type id)."
  type        = string
  default     = "Standard_DS3_v2"
}

variable "num_workers" {
  description = "Number of workers for the cluster (when not using autoscale)."
  type        = number
  default     = 2
}

variable "autotermination_minutes" {
  description = "Auto-termination timeout in minutes for idle clusters."
  type        = number
  default     = 30
}
