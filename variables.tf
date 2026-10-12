variable "semantic_views" {
  description = <<EOT
Map of semantic_views, attributes below
Required:
    - database
    - name
    - schema
    - tables (block):
        - comment (optional)
        - primary_key (optional)
        - synonym (optional)
        - table_alias (required)
        - table_name (required)
        - unique (optional, block):
            - values (required)
Optional:
    - comment
    - dimensions (block):
        - comment (optional)
        - qualified_expression_name (required)
        - sql_expression (required)
        - synonym (optional)
    - facts (block):
        - comment (optional)
        - is_private (optional)
        - qualified_expression_name (required)
        - sql_expression (required)
        - synonym (optional)
    - metrics (block):
        - is_private (optional)
        - semantic_expression (optional, block):
            - comment (optional)
            - qualified_expression_name (required)
            - sql_expression (required)
            - synonym (optional)
        - window_function (optional, block):
            - over_clause (required, block):
                - order_by (optional)
                - partition_by (optional)
                - window_frame_clause (optional)
            - qualified_expression_name (required)
            - sql_expression (required)
    - relationships (block):
        - referenced_relationship_columns (optional)
        - referenced_table_name_or_alias (required, block):
            - table_alias (optional)
            - table_name (optional)
        - relationship_columns (required)
        - relationship_identifier (optional)
        - table_name_or_alias (required, block):
            - table_alias (optional)
            - table_name (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    database = string
    name     = string
    schema   = string
    comment  = optional(string)
    tables = list(object({
      comment     = optional(string)
      primary_key = optional(list(string))
      synonym     = optional(set(string))
      table_alias = string
      table_name  = string
      unique = optional(list(object({
        values = list(string)
      })))
    }))
    dimensions = optional(list(object({
      comment                   = optional(string)
      qualified_expression_name = string
      sql_expression            = string
      synonym                   = optional(set(string))
    })))
    facts = optional(list(object({
      comment                   = optional(string)
      is_private                = optional(string)
      qualified_expression_name = string
      sql_expression            = string
      synonym                   = optional(set(string))
    })))
    metrics = optional(list(object({
      is_private = optional(string)
      semantic_expression = optional(object({
        comment                   = optional(string)
        qualified_expression_name = string
        sql_expression            = string
        synonym                   = optional(set(string))
      }))
      window_function = optional(object({
        over_clause = object({
          order_by            = optional(string)
          partition_by        = optional(string)
          window_frame_clause = optional(string)
        })
        qualified_expression_name = string
        sql_expression            = string
      }))
    })))
    relationships = optional(list(object({
      referenced_relationship_columns = optional(list(string))
      referenced_table_name_or_alias = object({
        table_alias = optional(string)
        table_name  = optional(string)
      })
      relationship_columns    = list(string)
      relationship_identifier = optional(string)
      table_name_or_alias = object({
        table_alias = optional(string)
        table_name  = optional(string)
      })
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.semantic_views : (
        length(v.tables) >= 1
      )
    ])
    error_message = "Each tables list must contain at least 1 items"
  }
}

