resource "aws_cloudfront_response_headers_policy" "this" {
  # checkov:skip=CKV_AWS_259: "HSTS configuration is intentionally optional for this module"
  name    = var.name
  comment = var.comment

  dynamic "cors_config" {
    for_each = var.cors_config != null ? [var.cors_config] : []
    content {
      access_control_allow_credentials = cors_config.value.access_control_allow_credentials

      dynamic "access_control_allow_headers" {
        for_each = length(cors_config.value.access_control_allow_headers) > 0 ? [cors_config.value.access_control_allow_headers] : []
        content {
          items = access_control_allow_headers.value
        }
      }

      dynamic "access_control_allow_methods" {
        for_each = length(cors_config.value.access_control_allow_methods) > 0 ? [cors_config.value.access_control_allow_methods] : []
        content {
          items = access_control_allow_methods.value
        }
      }

      dynamic "access_control_allow_origins" {
        for_each = length(cors_config.value.access_control_allow_origins) > 0 ? [cors_config.value.access_control_allow_origins] : []
        content {
          items = access_control_allow_origins.value
        }
      }
      dynamic "access_control_expose_headers" {
        for_each = length(cors_config.value.access_control_expose_headers) > 0 ? [cors_config.value.access_control_expose_headers] : []
        content {
          items = access_control_expose_headers.value
        }
      }

      access_control_max_age_sec = cors_config.value.access_control_max_age_sec
      origin_override            = cors_config.value.origin_override
    }
  }

  dynamic "security_headers_config" {
    for_each = var.security_headers_config != null ? [var.security_headers_config] : []
    content {
      dynamic "strict_transport_security" {
        for_each = security_headers_config.value.strict_transport_security != null ? [security_headers_config.value.strict_transport_security] : []
        content {
          access_control_max_age_sec = strict_transport_security.value.access_control_max_age_sec
          include_subdomains         = strict_transport_security.value.include_subdomains
          preload                    = strict_transport_security.value.preload
          override                   = strict_transport_security.value.override
        }
      }

      dynamic "content_type_options" {
        for_each = security_headers_config.value.content_type_options != null ? [security_headers_config.value.content_type_options] : []
        content {
          override = content_type_options.value.override
        }
      }

      dynamic "frame_options" {
        for_each = security_headers_config.value.frame_options != null ? [security_headers_config.value.frame_options] : []
        content {
          frame_option = frame_options.value.frame_option
          override     = frame_options.value.override
        }
      }

      dynamic "xss_protection" {
        for_each = security_headers_config.value.xss_protection != null ? [security_headers_config.value.xss_protection] : []
        content {
          protection = xss_protection.value.protection
          mode_block = xss_protection.value.mode_block
          report_uri = xss_protection.value.report_uri
          override   = xss_protection.value.override
        }
      }

      dynamic "referrer_policy" {
        for_each = security_headers_config.value.referrer_policy != null ? [security_headers_config.value.referrer_policy] : []
        content {
          referrer_policy = referrer_policy.value.referrer_policy
          override        = referrer_policy.value.override
        }
      }

      dynamic "content_security_policy" {
        for_each = security_headers_config.value.content_security_policy != null ? [security_headers_config.value.content_security_policy] : []
        content {
          content_security_policy = content_security_policy.value.content_security_policy
          override                = content_security_policy.value.override
        }
      }
    }
  }

  dynamic "custom_headers_config" {
    for_each = var.custom_headers_config != null ? [var.custom_headers_config] : []
    content {
      dynamic "items" {
        for_each = custom_headers_config.value.items != null ? custom_headers_config.value.items : []
        content {
          header   = items.value.header
          override = items.value.override
          value    = items.value.value
        }
      }
    }
  }

  dynamic "remove_headers_config" {
    for_each = length(var.remove_headers_config) > 0 ? [1] : []
    content {
      dynamic "items" {
        for_each = toset(var.remove_headers_config)
        content {
          header = items.value
        }
      }
    }
  }

  dynamic "server_timing_headers_config" {
    for_each = var.server_timing_headers_config != null ? [var.server_timing_headers_config] : []
    content {
      enabled       = server_timing_headers_config.value.enabled
      sampling_rate = server_timing_headers_config.value.sampling_rate
    }
  }
}
