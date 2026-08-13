resource "databricks_group" "workspace_group_1" {
  display_name = "dbx-test-1"
}

resource "databricks_user" "workspace_user_1" {
  user_name = "workspace_user_1@whoaks.ml"
}

resource "databricks_cluster" "dabx_cluster" {
  cluster_name            = var.cluster_name
  spark_version           = var.spark_version
  node_type_id            = var.node_type_id
  num_workers             = var.num_workers
  autotermination_minutes = var.autotermination_minutes
}
