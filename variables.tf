variable "schema_registry_keks" {
  description = <<EOT
Map of schema_registry_keks, attributes below
Required:
    - kms_key_id
    - kms_type
    - name
Optional:
    - doc
    - hard_delete
    - properties
    - rest_endpoint
    - shared
    - credentials (block):
        - key (required)
        - secret (required)
    - schema_registry_cluster (block):
        - id (required)
EOT

  type = map(object({
    kms_key_id    = string
    kms_type      = string
    name          = string
    doc           = optional(string)
    hard_delete   = optional(bool)
    properties    = optional(map(string))
    rest_endpoint = optional(string)
    shared        = optional(bool)
    credentials = optional(object({
      key    = string
      secret = string
    }))
    schema_registry_cluster = optional(object({
      id = string
    }))
  }))
  # Note: 5 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

