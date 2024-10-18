--use database <db>;
--use schema <sch>;

create or replace function random_uuid()
returns string
language java
handler = 'SnowflakeTools.randomUUID'
as $$
class SnowflakeTools{
  public static String randomUUID(){
    return java.util.UUID.randomUUID().toString();
  }
}
$$;