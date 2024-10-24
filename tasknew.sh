create  or replace function trigger_function()
returns trigger 
language plpgsql

as 
$$

declare 
t_id text;
t_data jsonb;
t_product jsonb;

begin 
    t_id:=(new.id);
    t_data :=(new.data-'level3ProductsList');
  t_product :=(new.data->>'level3ProductsList' );

 insert into trigger_table(id , data , product,
storetype
) 
 
 
 values(t_id,t_data,t_product,
   new.data -> 'storetype'

   );


return new;
end;

$$;

create or replace trigger trigger_name
  before update
  ON satish_table
  for each row
  execute procedure trigger_function();

update satish_table set data= data-'level3ProductsList' as level3ProductsList where id ='3tef';

select * from trigger_table;


#update data set address =address - 'street' where id=3;
# update metro set metro =jsonb_set(metro,'{routes,0,schedule,0,status}','"active"') where id ='3t8p';