# AWS CloudFront Response Headers Policy Module

This module manages the creation of Response Headers Policy for the CloudFront with features provided by Terraform AWS provider. It allows you to define and customize HTTP response headers to enhance security, improve performance, and ensure compliance with best practices. Use this module to simplify the configuration of response headers for your CloudFront distributions.

## Usage

```hcl
module "cloudfront_response_headers_policy" {
  source  = "realfredlai/cloudfront-response-headers-policy/aws"

  name    = "example-policy"
  comment = "test comment"

  cors_config = {
    access_control_allow_credentials = false
    access_control_allow_headers     = ["*"]
    access_control_allow_methods     = ["GET", "HEAD"]
    access_control_allow_origins     = ["*"]
    origin_override                  = true
  }
}
```

## Examples

- [Basic example](https://github.com/realfredlai/terraform-aws-cloudfront-response-headers-policy/tree/main/examples/basic)
- [Complete example](https://github.com/realfredlai/terraform-aws-cloudfront-response-headers-policy/tree/main/examples/complete)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_response_headers_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_response_headers_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_comment"></a> [comment](#input\_comment) | Comment for the CloudFront response headers policy | `string` | `""` | no |
| <a name="input_cors_config"></a> [cors\_config](#input\_cors\_config) | CORS configuration for the CloudFront response headers policy | <pre>object({<br/>    access_control_allow_credentials = optional(bool)<br/>    access_control_allow_headers     = optional(list(string), [])<br/>    access_control_allow_methods     = optional(list(string), [])<br/>    access_control_allow_origins     = optional(list(string), [])<br/>    access_control_expose_headers    = optional(list(string), [])<br/>    access_control_max_age_sec       = optional(number)<br/>    origin_override                  = optional(bool)<br/>  })</pre> | `null` | no |
| <a name="input_custom_headers_config"></a> [custom\_headers\_config](#input\_custom\_headers\_config) | Custom headers configuration for the CloudFront response headers policy | <pre>object({<br/>    items = optional(list(object({<br/>      header   = string<br/>      override = optional(bool)<br/>      value    = optional(string)<br/>    })))<br/>  })</pre> | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the CloudFront response headers policy | `string` | n/a | yes |
| <a name="input_remove_headers_config"></a> [remove\_headers\_config](#input\_remove\_headers\_config) | List of header names to remove from the response | `list(string)` | `[]` | no |
| <a name="input_security_headers_config"></a> [security\_headers\_config](#input\_security\_headers\_config) | Security headers configuration for the CloudFront response headers policy | <pre>object({<br/>    strict_transport_security = optional(object({<br/>      access_control_max_age_sec = optional(number)<br/>      include_subdomains         = optional(bool)<br/>      preload                    = optional(bool)<br/>      override                   = optional(bool)<br/>    }))<br/>    content_type_options = optional(object({<br/>      override = optional(bool)<br/>    }))<br/>    frame_options = optional(object({<br/>      frame_option = optional(string)<br/>      override     = optional(bool)<br/>    }))<br/>    xss_protection = optional(object({<br/>      protection = optional(bool)<br/>      mode_block = optional(bool)<br/>      report_uri = optional(string)<br/>      override   = optional(bool)<br/>    }))<br/>    referrer_policy = optional(object({<br/>      referrer_policy = optional(string)<br/>      override        = optional(bool)<br/>    }))<br/>    content_security_policy = optional(object({<br/>      content_security_policy = optional(string)<br/>      override                = optional(bool)<br/>    }))<br/>  })</pre> | `null` | no |
| <a name="input_server_timing_headers_config"></a> [server\_timing\_headers\_config](#input\_server\_timing\_headers\_config) | Server timing headers configuration for the CloudFront response headers policy | <pre>object({<br/>    enabled       = optional(bool)<br/>    sampling_rate = optional(string)<br/>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_response_headers_policy_arn"></a> [response\_headers\_policy\_arn](#output\_response\_headers\_policy\_arn) | The ARN of the CloudFront response headers policy. |
| <a name="output_response_headers_policy_etag"></a> [response\_headers\_policy\_etag](#output\_response\_headers\_policy\_etag) | The ETag of the CloudFront response headers policy. |
| <a name="output_response_headers_policy_id"></a> [response\_headers\_policy\_id](#output\_response\_headers\_policy\_id) | The ID of the CloudFront response headers policy. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
