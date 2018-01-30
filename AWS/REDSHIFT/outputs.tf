# Nicholas Conder nconder@gmail.com
# Output endpoint of the Redshift cluster
output "redshift_bucket_arn" {
  description = "Redshift S3 Bucket ARN"
  value = "${aws_s3_bucket.redshift.arn}"
}

output "redshift_cluster_endpoint" {
  description = "The RedShift cluster endpoint"
  value = "${module.redshift.redshift_cluster_endpoint}"
}