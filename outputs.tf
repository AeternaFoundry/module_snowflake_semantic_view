output "semantic_views_id" {
  description = "Map of id values across all semantic_views, keyed the same as var.semantic_views except keys with no id are omitted"
  value       = { for k, v in snowflake_semantic_view.semantic_views : k => v.id if v.id != null && length(v.id) > 0 }
}
output "semantic_views_comment" {
  description = "Map of comment values across all semantic_views, keyed the same as var.semantic_views except keys with no comment are omitted"
  value       = { for k, v in snowflake_semantic_view.semantic_views : k => v.comment if v.comment != null && length(v.comment) > 0 }
}
output "semantic_views_database" {
  description = "Map of database values across all semantic_views, keyed the same as var.semantic_views except keys with no database are omitted"
  value       = { for k, v in snowflake_semantic_view.semantic_views : k => v.database if v.database != null && length(v.database) > 0 }
}
output "semantic_views_dimensions" {
  description = "Map of dimensions values across all semantic_views, keyed the same as var.semantic_views except keys with no dimensions are omitted"
  value       = { for k, v in snowflake_semantic_view.semantic_views : k => v.dimensions if v.dimensions != null && length(v.dimensions) > 0 }
}
output "semantic_views_facts" {
  description = "Map of facts values across all semantic_views, keyed the same as var.semantic_views except keys with no facts are omitted"
  value       = { for k, v in snowflake_semantic_view.semantic_views : k => v.facts if v.facts != null && length(v.facts) > 0 }
}
output "semantic_views_fully_qualified_name" {
  description = "Map of fully_qualified_name values across all semantic_views, keyed the same as var.semantic_views except keys with no fully_qualified_name are omitted"
  value       = { for k, v in snowflake_semantic_view.semantic_views : k => v.fully_qualified_name if v.fully_qualified_name != null && length(v.fully_qualified_name) > 0 }
}
output "semantic_views_metrics" {
  description = "Map of metrics values across all semantic_views, keyed the same as var.semantic_views except keys with no metrics are omitted"
  value       = { for k, v in snowflake_semantic_view.semantic_views : k => v.metrics if v.metrics != null && length(v.metrics) > 0 }
}
output "semantic_views_name" {
  description = "Map of name values across all semantic_views, keyed the same as var.semantic_views except keys with no name are omitted"
  value       = { for k, v in snowflake_semantic_view.semantic_views : k => v.name if v.name != null && length(v.name) > 0 }
}
output "semantic_views_relationships" {
  description = "Map of relationships values across all semantic_views, keyed the same as var.semantic_views except keys with no relationships are omitted"
  value       = { for k, v in snowflake_semantic_view.semantic_views : k => v.relationships if v.relationships != null && length(v.relationships) > 0 }
}
output "semantic_views_schema" {
  description = "Map of schema values across all semantic_views, keyed the same as var.semantic_views except keys with no schema are omitted"
  value       = { for k, v in snowflake_semantic_view.semantic_views : k => v.schema if v.schema != null && length(v.schema) > 0 }
}
output "semantic_views_show_output" {
  description = "Map of show_output values across all semantic_views, keyed the same as var.semantic_views except keys with no show_output are omitted"
  value       = { for k, v in snowflake_semantic_view.semantic_views : k => v.show_output if v.show_output != null && length(v.show_output) > 0 }
}
output "semantic_views_tables" {
  description = "Map of tables values across all semantic_views, keyed the same as var.semantic_views except keys with no tables are omitted"
  value       = { for k, v in snowflake_semantic_view.semantic_views : k => v.tables if v.tables != null && length(v.tables) > 0 }
}

