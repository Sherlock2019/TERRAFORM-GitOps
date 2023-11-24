# AWS Glue for ETL (modules/glue/main.tf)

resource "aws_glue_catalog_database" "example" {
  name = "my_catalog_database"
}

resource "aws_glue_crawler" "example" {
  name       = "example-crawler"
  role       = aws_iam_role.example.arn
  database_name = aws_glue_catalog_database.example.name

  s3_target {
    path = "s3://my-example-bucket/"
  }

  schedule {
    schedule_expression = "cron(0 12 * * ? *)"
  }
}

