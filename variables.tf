variable "name" {
  description = "Name of the CloudFront response headers policy"
  type        = string
}

variable "comment" {
  description = "Comment for the CloudFront response headers policy"
  type        = string
  default     = ""
}

variable "cors_config" {
  description = "CORS configuration for the CloudFront response headers policy"
  type = object({
    access_control_allow_credentials = optional(bool)
    access_control_allow_headers     = optional(list(string), [])
    access_control_allow_methods     = optional(list(string), [])
    access_control_allow_origins     = optional(list(string), [])
    access_control_expose_headers    = optional(list(string), [])
    access_control_max_age_sec       = optional(number)
    origin_override                  = optional(bool)
  })
  default = null
}

variable "security_headers_config" {
  description = "Security headers configuration for the CloudFront response headers policy"
  type = object({
    strict_transport_security = optional(object({
      access_control_max_age_sec = optional(number)
      include_subdomains         = optional(bool)
      preload                    = optional(bool)
      override                   = optional(bool)
    }))
    content_type_options = optional(object({
      override = optional(bool)
    }))
    frame_options = optional(object({
      frame_option = optional(string)
      override     = optional(bool)
    }))
    xss_protection = optional(object({
      protection = optional(bool)
      mode_block = optional(bool)
      report_uri = optional(string)
      override   = optional(bool)
    }))
    referrer_policy = optional(object({
      referrer_policy = optional(string)
      override        = optional(bool)
    }))
    content_security_policy = optional(object({
      content_security_policy = optional(string)
      override                = optional(bool)
    }))
  })
  default = null
}

variable "custom_headers_config" {
  description = "Custom headers configuration for the CloudFront response headers policy"
  type = object({
    items = optional(list(object({
      header   = string
      override = optional(bool)
      value    = optional(string)
    })))
  })
  default = null
}

variable "remove_headers_config" {
  description = "List of header names to remove from the response"
  type        = list(string)
  default     = []
}

variable "server_timing_headers_config" {
  description = "Server timing headers configuration for the CloudFront response headers policy"
  type = object({
    enabled       = optional(bool)
    sampling_rate = optional(string)
  })
  default = null
}
