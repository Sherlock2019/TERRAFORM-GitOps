
resource "aws_redshift_cluster" "example" {
  cluster_identifier = "redshift-cluster-1"
  database_name      = "mydb"
  master_username    = "foo"
  master_password    = "Mustbe8characters"
  node_type          = "dc2.large"
  cluster_type       = "single-node"
}


