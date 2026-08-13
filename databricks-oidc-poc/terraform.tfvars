###############################################################################
# Variable Values
###############################################################################

# ─── Databricks Account ─────────────────────────────────────────────────────
# databricks_host       = "https://accounts.azuredatabricks.net/"
databricks_host = "https://adb-7405609113393234.14.azuredatabricks.net/"

databricks_account_id = "a66e1cfe-3e1f-40c8-b497-0b10a76e1644"

# ─── Azure Service Principal (sp-databricks-terraform-wif) ──────────────────
azure_subscription_id = "4c26ab7c-9d5b-4350-bb19-372a55ecf3bf"
# databricks_client_id       = "6428111d-9dd9-4909-b52c-b555eccd2cc4"
azure_tenant_id       = "d18895cc-999c-43f0-acda-6b008393110a"
# databricks_client_secret   = "dose363378d35bec8dda33e5aa5ab4923abe" 

# ─── Databricks Resources to Read ───────────────────────────────────────────
group_names = ["admins"]
user_name   = "mohit@whoaks.ml"

# ─── Databricks Cluster Settings ───────────────────────────────────────────
cluster_name            = "dabx-cluster-tf"
spark_version           = "17.3.x-scala2.13"
node_type_id            = "Standard_D4ds_v5"
num_workers             = 1
autotermination_minutes = 10
