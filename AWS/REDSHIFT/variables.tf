# variables
# Deployment region and universal tags
variable "region" { default = "us-east-1" }
variable "charge_code" {
  description = "Charge Code"
}
variable "environment" { 
  description = "Environment type. Dev | Test | Prod"
}
variable "iampolicy_s3rs" { 
  default = "iampolicys3rs"
  description = "IAM Role Name for Redshift Cluster and Storage Access"
}
variable "s3rs_role" { 
  default = "s3rs_role"
  description = "IAM Role Name for Redshift Cluster and Storage Access"
}
variable "DeploymentBy" { default = "Terraform-Dev" }

# S3Bucket
variable "redshift_bucket_name" { #default = "bucketrsdb-8a83a"
  description = "S3 Bucket Name"
}
variable "s3bucket_acl" { default = "private"}
# Redshift Cluster
variable "cluster_identifier" {  
  description = "Redshift ClusterID"
}
variable "rsdb_name" { 
  description = "Redshift DB Name"
}
variable "rsdb_dbauser" {
  description = "DB Username"
}
variable "rsdb_pswd" { 
  description = "DB Password... Must be eight characters long"
}
variable "rsdb_ctype" { default = "multi-node" }
variable "rsdb_ntype" {
  description = "Redshift cluster node type. Copy and paste one--> Valid Values: ds1.xlarge | ds1.8xlarge | ds2.xlarge | ds2.8xlarge | dc1.large | dc1.8xlarge."
}
variable "rsdb_number_of_nodes" {
  description = "Number of Node in the cluster. 3 is standard."
}
variable "wlm_json_configuration" {
  default = "[{\"query_concurrency\": 5}]"
}
