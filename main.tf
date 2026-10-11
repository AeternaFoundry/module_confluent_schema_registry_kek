resource "confluent_schema_registry_kek" "schema_registry_keks" {
  for_each = var.schema_registry_keks

  kms_key_id    = each.value.kms_key_id
  kms_type      = each.value.kms_type
  name          = each.value.name
  doc           = each.value.doc
  hard_delete   = each.value.hard_delete
  properties    = each.value.properties
  rest_endpoint = each.value.rest_endpoint
  shared        = each.value.shared

  dynamic "credentials" {
    for_each = each.value.credentials != null ? [each.value.credentials] : []
    content {
      key    = credentials.value.key
      secret = credentials.value.secret
    }
  }

  dynamic "schema_registry_cluster" {
    for_each = each.value.schema_registry_cluster != null ? [each.value.schema_registry_cluster] : []
    content {
      id = schema_registry_cluster.value.id
    }
  }
}

