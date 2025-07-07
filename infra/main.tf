provider "aws" {
region = var.region
}
resource "aws_s3_bucket" "static_site" {
bucket = var.bucket_name
tags = {
Name = "SiteEstáticoCI-CD"
}
}
resource "aws_s3_bucket_website_configuration" "static_site" {
bucket = aws_s3_bucket.static_site.id
index_document {
suffix = "index.html"
}
}
resource "aws_s3_bucket_policy" "public_read" {
bucket = aws_s3_bucket.static_site.id
policy = jsonencode({
Version: "2012-10-17",
Statement: [{
Effect: "Allow",
Principal: "*",
Action: "s3:GetObject",
Resource: "${aws_s3_bucket.static_site.arn}/*"
}]
})
}
resource "aws_s3_bucket_acl" "public_acl" {
bucket = aws_s3_bucket.static_site.id
acl = "public-read"
}