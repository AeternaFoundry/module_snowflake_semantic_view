resource "snowflake_semantic_view" "semantic_views" {
  for_each = var.semantic_views

  database = each.value.database
  name     = each.value.name
  schema   = each.value.schema
  comment  = each.value.comment

  dynamic "tables" {
    for_each = each.value.tables
    content {
      comment     = tables.value.comment
      primary_key = tables.value.primary_key
      synonym     = tables.value.synonym
      table_alias = tables.value.table_alias
      table_name  = tables.value.table_name
      dynamic "unique" {
        for_each = tables.value.unique != null ? tables.value.unique : []
        content {
          values = unique.value.values
        }
      }
    }
  }

  dynamic "dimensions" {
    for_each = each.value.dimensions != null ? each.value.dimensions : []
    content {
      comment                   = dimensions.value.comment
      qualified_expression_name = dimensions.value.qualified_expression_name
      sql_expression            = dimensions.value.sql_expression
      synonym                   = dimensions.value.synonym
    }
  }

  dynamic "facts" {
    for_each = each.value.facts != null ? each.value.facts : []
    content {
      comment                   = facts.value.comment
      is_private                = facts.value.is_private
      qualified_expression_name = facts.value.qualified_expression_name
      sql_expression            = facts.value.sql_expression
      synonym                   = facts.value.synonym
    }
  }

  dynamic "metrics" {
    for_each = each.value.metrics != null ? each.value.metrics : []
    content {
      is_private = metrics.value.is_private
      dynamic "semantic_expression" {
        for_each = metrics.value.semantic_expression != null ? [metrics.value.semantic_expression] : []
        content {
          comment                   = semantic_expression.value.comment
          qualified_expression_name = semantic_expression.value.qualified_expression_name
          sql_expression            = semantic_expression.value.sql_expression
          synonym                   = semantic_expression.value.synonym
        }
      }
      dynamic "window_function" {
        for_each = metrics.value.window_function != null ? [metrics.value.window_function] : []
        content {
          over_clause {
            order_by            = window_function.value.over_clause.order_by
            partition_by        = window_function.value.over_clause.partition_by
            window_frame_clause = window_function.value.over_clause.window_frame_clause
          }
          qualified_expression_name = window_function.value.qualified_expression_name
          sql_expression            = window_function.value.sql_expression
        }
      }
    }
  }

  dynamic "relationships" {
    for_each = each.value.relationships != null ? each.value.relationships : []
    content {
      referenced_relationship_columns = relationships.value.referenced_relationship_columns
      referenced_table_name_or_alias {
        table_alias = relationships.value.referenced_table_name_or_alias.table_alias
        table_name  = relationships.value.referenced_table_name_or_alias.table_name
      }
      relationship_columns    = relationships.value.relationship_columns
      relationship_identifier = relationships.value.relationship_identifier
      table_name_or_alias {
        table_alias = relationships.value.table_name_or_alias.table_alias
        table_name  = relationships.value.table_name_or_alias.table_name
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

