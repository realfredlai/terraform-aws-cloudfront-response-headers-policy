module "cloudfront_response_headers_policy" {
  source  = "realfredlai/cloudfront-response-headers-policy/aws"
  version = "0.1.0"

  name    = "example-policy"
  comment = "test comment"

  cors_config = {
    access_control_allow_credentials = false
    access_control_allow_headers     = ["*"]
    access_control_allow_methods     = ["GET", "HEAD", "OPTIONS"]
    access_control_allow_origins     = ["*"]
    access_control_expose_headers    = []
    access_control_max_age_sec       = 86400
    origin_override                  = true
  }

  security_headers_config = {
    content_security_policy = {
      content_security_policy = "default-src 'none';"
      override                = true
    }
    strict_transport_security = {
      access_control_max_age_sec = 31536000
      include_subdomains         = true
      preload                    = true
      override                   = false
    }
    content_type_options = {
      override = true
    }
    frame_options = {
      frame_option = "DENY"
      override     = false
    }
    xss_protection = {
      protection = true
      mode_block = true
      report_uri = ""
      override   = false
    }
    referrer_policy = {
      referrer_policy = "strict-origin-when-cross-origin"
      override        = false
    }
  }

  custom_headers_config = {
    items = [
      {
        header   = "Cache-Control"
        value    = "max-age=15552000, s-maxage=15552000, public"
        override = true
      },
      {
        header   = "X-Permitted-Cross-Domain-Policies"
        value    = "none"
        override = true
      }
    ]
  }

  remove_headers_config = [
    "Set-Cookie"
  ]

  server_timing_headers_config = {
    enabled       = true
    sampling_rate = 50
  }
}
