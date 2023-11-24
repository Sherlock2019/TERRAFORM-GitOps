#  Athena for SQL Querying (modules/athena/main.tf)

resource "aws_athena_database" "example" {
  name   = "example_database"
  bucket = aws_s3_bucket.example.bucket
}

resource "aws_athena_named_query" "example" {
  name  = "example_query"
  database = aws_athena_database.example.name
  query = "SELECT * FROM my_table LIMIT 10;"
}
