output "s3_bucket" {
  value = aws_s3_bucket.default.id
}

output "website_endpoint" {
	value = aws_s3_bucket_website_configuration.default.website_endpoint
}