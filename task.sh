create  or replace function trigger_function()
returns trigger 
language plpgsql

as 
$$

declare 
id text;
data jsonb;


begin 
    id:= (select id from satish_table );
    data:= (select data from satish_table where id = '3tef');

 insert into trigger_table(id , data ) values(new.id, new.data);


return new;
end;

$$;

create  trigger trigger_name
  after update
  ON satish_table
  for each row
  execute procedure trigger_function();

update satish_table set data=jsonb_set(data,'{crop}','"paddy"')where id ='3t8y' li;

