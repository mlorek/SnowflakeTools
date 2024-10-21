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

resource "snowflake_function" "py_random_uuid" {
  database    = "DB"
  schema      = "SCH"
  name        = "PY_RANDOM_UUID"
  return_type = "STRING"
  language    = "PYTHON"
  handler     = "random_uuid"
  statement   = <<EOT
import uuid
def random_uuid():
  return str(uuid.uuid4())
EOT
}