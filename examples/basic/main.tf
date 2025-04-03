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
    origin_override                  = true
  }
}
