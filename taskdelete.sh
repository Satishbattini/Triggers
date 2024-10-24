create or replace function delete_function()
returns trigger
language plpgsql
as 
$$
begin 

UPDATE trigger_table
SET product = product-'productLevel3Id' where id=new.id;

return new;
end
$$;

create or replace trigger delete_trigger 
after update 
on satish_table
for each row
execute procedure delete_function();

UPDATE satish_table
SET data = jsonb_set(
    data, 
    '{level3ProductsList}', 
    (SELECT jsonb_agg(elem)
     FROM jsonb_array_elements(data->'level3ProductsList') AS elem
     WHERE elem->>'productLevel3Id' <> '3tek')
)
WHERE id = '3tei';


   update trigger_table set product = null where id ='new.id';
update satish_table set data=data-'level3ProductsList' where id ='3t8y';

3uqj  , 3xxe   
"3xxf"
 "3y8w"
 "3yv7"
 "3zrh"
 "40ce" 
 , 3tgswqq ,             l3=   3tbo  0sfm


 s_id:= select count(*) AS product_count FROM satish_table, Lateral jsonb_array_elements(data->'level3ProductsList') AS product WHERE id = 'new.id';
# UPDATE satish_table
# SET data = jsonb_set(data, '{level3ProductsList}', data->'level3ProductsList')
# WHERE jsonb_array_elements(data->'level3ProductsList')->'productLevel3Id' = '3tbm';


# update lavanya_table set data=data->'level3ProductsList' where data->'level3ProductsList'->'productLevel3Id' ='4gez';


# UPDATE lavanya_table
# SET data = data - 'level3ProductsList'
# WHERE data->'level3ProductsList'->>'productLevel3Id' = '4gez';

#update data set address =address - 'street' where id=3;

#update trigger_table data=data-'level3ProductsList' where id ='3t8y';
# delete product from trigger_table where id='new.id';
3t8y
 3tbm
 3tec
 3tei
 3tel
 3tgm


    productLevel3Id := (SELECT elem->>'productLevel3Id'
                        FROM jsonb_array_elements(NEW.data->'level3ProductsList') AS elem
                        WHERE elem->>'productLevel3Id' = OLD.data->>'productLevel3Id');
    



    UPDATE satish_table
    SET data = jsonb_set(
        data, 
        '{level3ProductsList}', 
        (SELECT jsonb_array_elements(data->'level3ProductsList')->'productLevel3Id'
        FROM satish_table
        WHERE jsonb_array_elements(data->'level3ProductsList')->'productLevel3Id' ='40ce')
    )
    WHERE id = '3xxe';

    update satish_table set dat =jsonb_set(data, '{level3ProductsList},'"null"' ')



update satish_table
set data = jsonb_set(data, '{level3ProductsList}', jsonb_remove_array_element(data->'level3ProductsList', '{"productLevel3Id":40ce}'))
where data->'level3ProductsList'  @> '[{"productLevel3Id":40ce}]'
returning *;

UPDATE satish_table
SET data = jsonb_set(data, '{level3ProductsList}', 'null'::jsonb, true)
WHERE jsonb_array_elements(data->'level3ProductsList')->'productLevel3Id'='40ce';

 UPDATE satish_table
    SET data = jsonb_set(
        data, 
        '{level3ProductsList}', 
        (SELECT jsonb_agg(elem)
        FROM jsonb_array_elements(data->'level3ProductsList') AS elem
        WHERE elem->>'productLevel3Id' = 40ce)
    )
    WHERE id = NEW.id;
