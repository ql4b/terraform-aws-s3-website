locals {
  index_document = var.index_document
  error_document = var.error_document
	hostname			 = var.hostname
}

resource "aws_s3_bucket" "default" {
  bucket = local.hostname
  tags   = module.this.tags
}

resource "aws_s3_bucket_public_access_block" "default" {
  bucket = aws_s3_bucket.default.id

  block_public_acls       = true
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.default.id
  policy = data.aws_iam_policy_document.s3_public_read.json
}

data "aws_iam_policy_document" "s3_public_read" {
  statement {
    actions = [
      "s3:GetObject"
    ]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    resources = [
      "${aws_s3_bucket.default.arn}/*",
    ]
  }
}

resource "aws_s3_bucket_website_configuration" "default" {
  bucket = aws_s3_bucket.default.id

  index_document {
    suffix = local.index_document
  }

  error_document {
    key = local.error_document
  }
}