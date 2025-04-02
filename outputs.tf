output "response_headers_policy_arn" {
  description = "The ARN of the CloudFront response headers policy."
  value       = aws_cloudfront_response_headers_policy.this.arn
}

output "response_headers_policy_id" {
  description = "The ID of the CloudFront response headers policy."
  value       = aws_cloudfront_response_headers_policy.this.id
}

output "response_headers_policy_etag" {
  description = "The ETag of the CloudFront response headers policy."
  value       = aws_cloudfront_response_headers_policy.this.etag
}
