# Nicholas Conder nconder@gmail.com
# Define the common tags for all resources
locals {
  common_tags = {
    DeploymentBy   = "${var.DeploymentBy}"
    Environment = "${var.environment}"
    ChargeCode = "${var.charge_code}"
  }
}

# S3Bucket
resource "aws_s3_bucket" "Name" {
   bucket = "${var.redshift_bucket_name}"
   acl = "${var.s3bucket_acl}"

   tags = "${merge(
    local.common_tags,
    map(
     "name", "${var.redshift_bucket_name}"
    )
  )}"
}

# RedShift Cluster
resource "aws_redshift_cluster" "main_redshift_cluster" {
  cluster_identifier = "${var.cluster_identifier}"
  database_name = "${var.rsdb_name}"
  master_username = "${var.rsdb_dbauser}"
  master_password = "${var.rsdb_pswd}"
  node_type = "${var.rsdb_ntype}"
  cluster_type = "${var.rsdb_ctype}"
  number_of_nodes = "${var.rsdb_number_of_nodes}"

   tags = "${merge(
    local.common_tags,
    map(
     "cluster_identifier", "${var.cluster_identifier}",
     "database_name", "${var.rsdb_name}",
     "cluster_type", "${var.rsdb_ctype}"
    )
  )}"
  
}
