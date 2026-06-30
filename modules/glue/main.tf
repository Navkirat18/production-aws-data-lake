resource "aws_glue_catalog_database" "this" {
  name = "${var.project_name}-${var.environment}-catalog"
}
resource "aws_glue_crawler" "raw" {
  name          = "${var.project_name}-${var.environment}-crawler"
  role          = var.glue_role_arn
  database_name = aws_glue_catalog_database.this.name

  s3_target {
    path = "s3://${var.bucket_name}/raw/"
  }

  schema_change_policy {
    update_behavior = "UPDATE_IN_DATABASE"
    delete_behavior = "LOG"
  }
}