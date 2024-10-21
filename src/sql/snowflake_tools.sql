--use database <db>;
--use schema <sch>;

-- Java version
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

-- SQL version
create or replace function random_uuid_2()
returns string
as
$$
with h as (
    select md5(random()) as h
)
select substr(h, 1, 8) || '-' || substr(h, 9, 4) || '-' || substr(h, 13, 4) || '-' || substr(h, 17, 4) || '-' || substr(h, 21, 12) as g
from h
$$;

-- Python version
create or replace function py_random_uuid()
returns string
language python
runtime_version = '3.8'
handler = 'random_uuid'
as
$$
import uuid

def random_uuid():
  return str(uuid.uuid4())
$$;