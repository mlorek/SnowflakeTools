resource "snowflake_function" "random_uuid" {
  database    = "DB"
  schema      = "SCH"
  name        = "RANDOM_UUID"
  return_type = "STRING"
  language    = "JAVA"
  handler     = "SnowflakeTools.randomUUID"
  statement   = <<EOT
class SnowflakeTools{
  public static String randomUUID(){
    return java.util.UUID.randomUUID().toString();
  }
}
EOT
}