create  or replace function trigger_function2()
returns trigger 
language plpgsql

as 
$$

begin 
    
 insert into trigger_table(id , data ,product) values (OLD.id,NEW.data-'level3ProductsList', jsonb_array_elements(NEW.data->'level3ProductsList'));


return new;

end;

$$;

create or replace trigger trigger_name2
  AFTER update
  ON satish_table
  for each row
  execute procedure trigger_function2();

update satish_table set data=jsonb_set(data,'{crop}','""') where id='3xxe'; 